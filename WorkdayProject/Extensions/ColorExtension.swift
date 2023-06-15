//
//  ColorExtension.swift
//  WorkdayProject
//
//  Created by user242726 on 6/13/23.
//

import Foundation
import SwiftUI


/// Extending color to use developer-defined colors
extension Color {
    static let theme = ColorTheme()
    
}

/// Contains the definition of all the colors
struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
}
