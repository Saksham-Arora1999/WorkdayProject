//
//  Nasa.swift
//  WorkdayProject
//
//  Created by user242726 on 6/14/23.
//

import Foundation

// MARK: - Nasa

/// API Response is the model to map json result of the API call
struct APIResponse: Codable {
    let collection: Collection
}

// MARK: - Collection
struct Collection: Codable {
    var items: [Item]
    	
}

// MARK: - Item
struct Item: Codable {
    let data: [Detail]
    let links: [ItemLink]
}

// MARK: - Detail

/// Detail is a model which will contain all the details related to an image
struct Detail: Codable {
    let description, title: String
    let photographer: String?
    let location: String?
    let nasaID: String
    let dateCreated: String
    
    
    enum CodingKeys: String, CodingKey {
        case description, title, photographer, location
        case nasaID = "nasa_id"
        case dateCreated = "date_created"
        
    }
}

// MARK: Item Link
/// Model which only contains the link for the image
struct ItemLink: Codable {
    let href: String
    
}

// MARK: Data
struct NasaData: Identifiable {
    let id: String
    let description, title: String
    let photographer: String?
    let location: String?
    let dateCreated: String
    let imageLink: String
    
    init(detail: Detail, itemLink: ItemLink) {
        self.id = detail.nasaID
        self.description = detail.description
        self.title = detail.title
        self.photographer = detail.photographer
        self.location = detail.location
        self.dateCreated = detail.dateCreated
        self.imageLink = itemLink.href
    }
    
}
