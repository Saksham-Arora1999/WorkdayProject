//
//  helper.swift
//  WorkdayProjectTests
//
//  Created by user242726 on 6/16/23.
//

import Foundation
@testable import WorkdayProject

/// helper class with fake data
struct helper {
    static var instance: HelperClass {
        HelperClass.instance
    }
}

class HelperClass {
    static let instance = HelperClass()
    let APIResponse: Data
    private init() {
        APIResponse = Data(json.utf8)
    }
    
    let testData = NasaData(detail:
                                Detail(description: "The Mars celebration Friday, May 31, 2019, in Mars,Pennsylvania",
                                       title: "Mars Celebration",
                                       photographer: "Mars Celebration",
                                       location: "Mars, PA, USA",
                                       nasaID: "NHQ201905310026",
                                       dateCreated: "2019-05-31T00:00:00Z"),
                            itemLink: ItemLink(href: "https://images-assets.nasa.gov/image/NHQ201905310026/NHQ201905310026~thumb.jpg"))
    
    let json = """
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
    """
    
}
