//
//  BackgroundShadowBox.swift
//  WorkdayProject
//
//  Created by user242726 on 6/13/23.
//

import SwiftUI

/// This is Shadow Box which will be reused multiple times with a give corner radius and opacity
///
/// This is a reusable rounded rectangle box which has shadow of type Color.theme.accent and and is filled with Color.theme.background so it acts as a shodow box
///
/// - Parameter cornerRadius: Coner radius of the shadow
/// - Parameter opacity: Sets the opacity of the shadow
/// - Returns: Returns a view
///

struct BackgroundShadowBox: View {
    
    
    let cornerRadius: CGFloat
    let opacity: CGFloat
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color.theme.background)
            .shadow(color: Color.theme.accent.opacity(opacity),
                    radius: cornerRadius)
        
    }
}

struct BackgroundShadowBox_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundShadowBox(cornerRadius: 20, opacity: 20)
            .frame(width: 100, height: 100)
    }
}
