//
//  PreviewProvider.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var test: TestInstance {
        return TestInstance.instance
    }
}

class TestInstance {
    static let instance = TestInstance()
    
    private init() {
        
    }
    //let hvm = HomeViewModel()
    
    let testDescription = Detail(id: "NHQ201905310026",
                                 description: "The Mars celebration Friday, May 31, 2019, in Mars, Pennsylvania",
                                 title: "Mars Celebration",
                                 photographer: "Mars Celebration",
                                 location: "Mars, PA, USA",
                                 dateCreated: ISO8601DateFormatter().date(from: "2019-05-31T00:00:00Z")!)
    
    let testImage = ItemLink(imageLink: "https://images-assets.nasa.gov/image/NHQ201905310026/NHQ201905310026~thumb.jpg")
}
