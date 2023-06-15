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
    @StateObject var vm = HomeViewModel()
    
    // MARK: BODY
    
    var body: some View {
        
        ZStack {
            Color.theme.green.ignoresSafeArea()
            VStack {
                SearchBarView(searchText: $searchText)
                //Spacer()
                List{
                    
                    ForEach(vm.data) { item in
                        
                        NavigationLink(destination: DetailView(data: item)) {
                            ImageRowView(data: item)
                        }
                        
                            
                            
                    }
                    
                }.listStyle(.plain)
                    .background(Color.theme.background)
            }
        }.task {
            await vm.fetch()
        }
    }
}

// MARK: PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
