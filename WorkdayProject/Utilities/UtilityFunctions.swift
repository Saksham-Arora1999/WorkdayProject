//
//  UtilityFunctions.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation


/// Class which contains helper function used around the application
class UtilityFunctions {
    
    /// Function which transforms date "yyyy-MM-dd'T'HH:mm:ssZ" -> "MMM d, yyyy"
    ///
    /// This function will convert "2019-05-31T00:00:00Z" into "May 31, 2019"
    ///
    /// - Parameter dateString: is string in format "yyyy-MM-dd'T'HH:mm:ssZ"
    /// - Returns: String: in format "MMM d, yyyy"
    static func transformDate(dateString: String) -> String {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMM d, yyyy"
            
            let formattedDate = outputFormatter.string(from: date)
            return formattedDate // Output: May 31, 2019
        } else {
            return "Not Available"
        }
    }
}
