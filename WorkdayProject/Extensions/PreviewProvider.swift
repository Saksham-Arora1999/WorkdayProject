//
//  PreviewProvider.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation
import SwiftUI

//. Extending PreviewProvider to have test instances to use them while playing around with views
extension PreviewProvider {
    static var test: TestInstance {
        return TestInstance.instance
    }
}

/// Singleton class which contains test instances
class TestInstance {
    static let instance = TestInstance()
    
    private init() {}
    
    let testDescription = Detail(description: "The Mars celebration Friday, May 31, 2019, in Mars,Pennsylvania",
                                 title: "Mars Celebration",
                                 photographer: "Mars Celebration",
                                 location: "Mars, PA, USA",
                                 nasaID: "NHQ201905310026",
                                 dateCreated: "2019-05-31T00:00:00Z")
    
    
    let testImage = ItemLink(href: "https://images-assets.nasa.gov/image/NHQ201905310026/NHQ201905310026~thumb.jpg")
    
    let testData = NasaData(detail:
                                Detail(description: "The Mars celebration Friday, May 31, 2019, in Mars,Pennsylvania",
                                       title: "Mars Celebration",
                                       photographer: "Mars Celebration",
                                       location: "Mars, PA, USA",
                                       nasaID: "NHQ201905310026",
                                       dateCreated: "2019-05-31T00:00:00Z"),
                            itemLink: ItemLink(href: "https://images-assets.nasa.gov/image/NHQ201905310026/NHQ201905310026~thumb.jpg"))
}
