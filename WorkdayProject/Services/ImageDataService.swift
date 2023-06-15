//
//  ImageDataService.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation
import SwiftUI

//MARK: Protocol ImageDataLayer
protocol ImageDataLayer {
    func getImage() async throws -> UIImage
    
}

/// ImageDataService is used to fetch images
class ImageDataService: ImageDataLayer {
    
    let fileManager = LocalFileManager.instance
    let networkManager = NetworkManager.instance
    let data: NasaData
    let dirName = "Nasa_Images"
    
    init(data: NasaData) {
        self.data = data
    }
    
    /// Function to get image
    ///
    /// First it checks if the image is already cached by the FileManager, and if not it downloads the image and stores it
    ///
    ///- Returns: UIImage
    func getImage() async throws -> UIImage {
        
        // Find saved image
        
        if let savedImage = fileManager.getImage(imageName: data.id, directoryName: dirName) {
            // Image was already saved in the cache
            return savedImage
        } else {
            // No image found going to download it
            return try await downloadImage()
        }
    }
    
    /// Function to download the image
    ///
    /// If the image os not already downloaded this method is called
    ///
    /// - Returns: UIImage
    private func downloadImage() async throws -> UIImage{
        
        let returnedData = try await networkManager.fetch(url: data.imageLink)
        
        if let image = UIImage(data: returnedData) {
            
            fileManager.saveImage(image: image, imageName: data.id, directoryName: dirName)
            
            return image
        }
        
        throw NSError()
        
    }
}
