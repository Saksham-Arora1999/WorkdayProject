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
    let items: [Item]
    	
}

// MARK: - Item
struct Item: Codable {
    let data: [Detail]
    let links: [ItemLink]
}

// MARK: - Detail

/// Detail is a model which will contain all the details related to an image
struct Detail: Codable, Identifiable {
    let id: String
    let description, title: String
    let photographer: String?
    let location: String?
    let dateCreated: Date
    
    enum CodingKeys: String, CodingKey {
        case description, title, photographer, location, dateCreated
        case id = "nasaId"
    }

    
}

// MARK: Item Link
/// Model which only contains the link for the image
struct ItemLink: Codable {
    let imageLink: String
    
    enum CodingKeys: String, CodingKey {
        case imageLink = "href"
    }
}
