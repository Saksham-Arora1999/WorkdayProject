//
//  HomeView.swift
//  WorkdayProject
//
//  Created by user242726 on 6/13/23.
//

import SwiftUI

/// Home View of the App

struct HomeView: View {
    
    // MARK: PROPERTIES
    
    @StateObject var vm = HomeViewModel()
    
    // MARK: BODY
    
    var body: some View {
        
        ZStack {
            Color.theme.green.ignoresSafeArea()
            VStack {
                SearchBarView(searchText: $vm.searchText)
                //Spacer()
                List{
                    
                    ForEach(vm.data) { item in
                        
                        NavigationLink(destination:LazyView { DetailView(data: item) }, label:  { ImageRowView(data: item) })
                            .task {
                                if item == vm.data.last {
                                    await vm.loadMoreData()
                                }
                            }
                            
                    }
                    
                }.listStyle(.plain)
                    .background(Color.theme.background)
            }
        }.task {
            if vm.data.isEmpty {
                await vm.fetch()
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
