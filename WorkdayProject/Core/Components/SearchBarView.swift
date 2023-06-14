//
//  SearchBarView.swift
//  WorkdayProject
//
//  Created by user242726 on 6/13/23.
//

import SwiftUI

/// Reusable search bar
///
/// This is a resuble search view, which has a magnifying glass icon on the left side and a cross icon on the right to exit the search bar
///
/// - Parameter searchText: State variable passed to get the entered text in the search field
/// - Returns: View

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.trailing)
                .foregroundColor(Color.theme.green)
            
            TextField("Enter your meal...", text: $searchText)
                .foregroundColor(Color.theme.green)
                .overlay(
                    Image(systemName: "xmark.circle")
                        .foregroundColor(Color.theme.green)
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEdititng()
                        }
                    , alignment: .trailing
                )
        }
        .font(.title2)
        .padding()
        .background(BackgroundShadowBox(cornerRadius: 25, opacity: 25))
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
