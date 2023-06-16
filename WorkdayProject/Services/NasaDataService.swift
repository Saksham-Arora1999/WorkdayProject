//
//  NasaDataService.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation

// URL: https://images-api.nasa.gov/search?q=mars&media_type=image

/*
 {
    "collection":{
       "version":"1.0",
       "href":"http://images-api.nasa.gov/search?q=mars&media_type=image&page=1&page_size=2",
       "items":[
          {
             "href":"https://images-assets.nasa.gov/image/NHQ201905310026/collection.json",
             "data":[
                {
                   "description":"The Mars celebration Friday, May 31, 2019, in Mars, Pennsylvania. NASA is in the small town to celebrate Mars exploration and share the agency’s excitement about landing astronauts on the Moon in five years. The celebration includes a weekend of Science, Technology, Engineering, Arts and Mathematics (STEAM) activities. Photo Credit: (NASA/Bill Ingalls)",
                   "title":"Mars Celebration",
                   "photographer":"NASA/Bill Ingalls",
                   "location":"Mars, PA, USA",
                   "nasa_id":"NHQ201905310026",
                   "date_created":"2019-05-31T00:00:00Z",
                   "keywords":[
                      "Mars",
                      "Mars Celebration",
                      "Pennsylvania"
                   ],
                   "media_type":"image",
                   "center":"HQ"
                }
             ],
             "links":[
                {
                   "href":"https://images-assets.nasa.gov/image/NHQ201905310026/NHQ201905310026~thumb.jpg",
                   "rel":"preview",
                   "render":"image"
                }
             ]
          },
          {
             "href":"https://images-assets.nasa.gov/image/NHQ201905310033/collection.json",
             "data":[
                {
                   "description":"The Mars celebration Friday, May 31, 2019, in Mars, Pennsylvania. NASA is in the small town to celebrate Mars exploration and share the agency’s excitement about landing astronauts on the Moon in five years. The celebration includes a weekend of Science, Technology, Engineering, Arts and Mathematics (STEAM) activities. Photo Credit: (NASA/Bill Ingalls)",
                   "title":"Mars Celebration",
                   "photographer":"NASA/Bill Ingalls",
                   "location":"Mars, PA, USA",
                   "nasa_id":"NHQ201905310033",
                   "date_created":"2019-05-31T00:00:00Z",
                   "keywords":[
                      "Mars",
                      "Mars Celebration",
                      "Pennsylvania"
                   ],
                   "media_type":"image",
                   "center":"HQ"
                }
             ],
             "links":[
                {
                   "href":"https://images-assets.nasa.gov/image/NHQ201905310033/NHQ201905310033~thumb.jpg",
                   "rel":"preview",
                   "render":"image"
                }
             ]
          }
       ],
       "metadata":{
          "total_hits":25073
       },
       "links":[
          {
             "rel":"next",
             "prompt":"Next",
             "href":"http://images-api.nasa.gov/search?q=mars&media_type=image&page=2&page_size=2"
          }
       ]
    }
 }
 */

// MARK: NasaDataLayer
protocol NasaDataLayer {
    func fetch(url: String) async throws -> [NasaData]
}


// MARK: NasaDataService
class NasaDataService: NasaDataLayer {
    
    let networkManager: NetworkLayer
    
    init(networkManager: NetworkLayer = NetworkManager.instance) {
        self.networkManager = networkManager
    }
    
    /// Responsible for decoding data into NasaData format
    ///
    /// Makes call to the network manager fetch function to grab data and returns the data in the decoded form to be used by application
    ///
    /// - Parameter url: String for the API call
    /// - Returns: An array of NasaData or throws an error
    func fetch(url: String) async throws -> [NasaData] {
        
        do {
            let data = try await networkManager.fetch(url: url)
            
            let returnedData =  try JSONDecoder().decode(APIResponse.self, from: data)
            
            return returnedData.collection.items.map {  NasaData(detail: $0.data[0], itemLink: $0.links[0]) }
        } catch {
            throw error
        }
        
        
    }
    
}
