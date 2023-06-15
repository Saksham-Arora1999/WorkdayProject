//
//  LocalFileManager.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
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
            print("Erro saving image: \(err)")
        }
        
    }
    
    func getImage(imageName: String, directoryName: String) -> UIImage?{
        
        guard
            let url = getUrlForImage(imageName: imageName, directoryName: directoryName),
            FileManager.default.fileExists(atPath: url.path)
        else {return nil}
        
        return UIImage(contentsOfFile: url.path)
    }
    
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
    
    private func getUrlForDirectory(directoryName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {return nil}
        
        return url.appendingPathComponent(directoryName)
    }
    
    private func getUrlForImage(imageName: String, directoryName: String) -> URL? {
        guard
            let url = getUrlForDirectory(directoryName: directoryName)
        else {return nil}
        
        return url.appendingPathComponent(imageName + ".jpg")
    }
}
