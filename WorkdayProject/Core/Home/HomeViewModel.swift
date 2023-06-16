//
//  HomeViewModel.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation
import AsyncAlgorithms


/// Home View Model: Manages the data for Home View
@MainActor
class HomeViewModel: ObservableObject {
    
    @Published private(set) var data: [NasaData] = []
    @Published var searchText: String = ""
    private var pageNumber: Int = 0
    private var pageSize: Int = 10
    private let pageLimit: Int
    private var tasks = Set<TaskCancellable>()
    
    
    private let nasaDataService: NasaDataLayer
    
    init(nasaDataService: NasaDataLayer = NasaDataService()) {
        
        self.nasaDataService = nasaDataService
        self.pageLimit = 10000/self.pageSize
        
        Task {
            for await _ in $searchText.values.debounce(for: .seconds(0.2)) {
                await fetch()
            }
        }.store(in: &tasks)
    }
    
    /// Initial fetch for the search text
    func fetch() async {
        pageNumber = 1
        if searchText.isEmpty {
            self.data = []
            return
        }
        let url = "https://images-api.nasa.gov/search?q=\(searchText)&media_type=image&page=\(pageNumber)&page_size=\(pageSize)"
        
        do {
            let newData = try await nasaDataService.fetch(url: url)
            self.data = newData
        } catch (let err) {
            print(err)
        }
    }
    
    /// To take advantage of the pagination
    func loadMoreData() async {
        pageNumber += 1
        let url = "https://images-api.nasa.gov/search?q=\(searchText)&media_type=image&page=\(pageNumber)&page_size=\(pageSize)"
        
        do {
            let newData = try await nasaDataService.fetch(url: url)
            self.data.append(contentsOf: newData)
        } catch (let err) {
            print(err)
        }
    }
}
