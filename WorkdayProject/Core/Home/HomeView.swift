//
//  HomeView.swift
//  WorkdayProject
//
//  Created by user242726 on 6/13/23.
//

import SwiftUI

/// Home View of the App
///

struct HomeView: View {
    
    // MARK: PROPERTIES
    
    @State var searchText = ""
    
    // MARK: BODY
    
    var body: some View {
        
        ZStack {
            
            VStack {
                SearchBarView(searchText: $searchText)
                
            }
        }
    }
}

// MARK: PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
