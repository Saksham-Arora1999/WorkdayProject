//
//  LocalFileManager.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation
import SwiftUI


/// Singleton class to enable caching for images in the filemanager
class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    // MARK: SaveImage
    /// Saves an image in the cache
    ///
    /// First creates a directory, then builds url for the file where image needs to be saved and then tries to svae image
    ///
    /// - Parameter image: UIImage to be saved
    /// - Parameter imageName: Image Name, must be unique for all the images
    /// - Parameter directoryName: Directory name under which all the images will be saved (usually app name)
    
    func saveImage(image: UIImage, imageName: String, directoryName: String) {
        
        // Create Directory
        self.createDirectory(directoryName: directoryName)
        
        //Get Url
        guard
            let data = image.jpegData(compressionQuality: 0.8),
            let url = getUrlForImage(imageName: imageName, directoryName: directoryName)
        else { return }
        
        // Save Image
        do{
            try data.write(to: url)
        } catch let err {
            print("Error saving image: \(err)")
        }
        
    }
    
    // MARK: GetImage
    /// Retrieves image from storage
    ///
    /// First builds the url and then returns the image
    ///
    /// - Parameter imageName: Name of the image to be retrieved
    /// - Parameter directoryName: Name of the directory where the image is stored
    func getImage(imageName: String, directoryName: String) -> UIImage?{
        
        guard
            let url = getUrlForImage(imageName: imageName, directoryName: directoryName),
            FileManager.default.fileExists(atPath: url.path)
        else {return nil}
        
        return UIImage(contentsOfFile: url.path)
    }
    
    
    // MARK: CreateDirectory
    /// Creates directory
    ///
    /// First checks if a directory already exists and and creates if not
    ///
    ///- Parameter directoryName: Name of the directory
    private func createDirectory(directoryName: String) {
        
        guard
            let url = getUrlForDirectory(directoryName: directoryName) else {return}
        
        if !FileManager.default.fileExists(atPath: url.path) {
            
            do {
                try FileManager.default.createDirectory(atPath: url.path, withIntermediateDirectories: true)
            } catch let error {
                print("Error \(error.localizedDescription) with \(directoryName)")
            }
            
        }
    }
    
    // MARK: GetURLForDirectory
    /// Gives URL for the directory
    ///
    ///- Parameter directoryname: Name of the directory
    ///- Returns: URL for the directory in the cache
    private func getUrlForDirectory(directoryName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {return nil}
        
        return url.appendingPathComponent(directoryName)
    }
    
    // MARK: GetURLForImage
    
    /// Function returns url for the image in the cache
    ///- Parameter imageName: name of the image
    ///- Parameter directoryName: Name of the directory
    ///- Returns: URL where the is saved or is going to be saved
    private func getUrlForImage(imageName: String, directoryName: String) -> URL? {
        guard
            let url = getUrlForDirectory(directoryName: directoryName)
        else {return nil}
        
        return url.appendingPathComponent(imageName + ".jpg")
    }
}
