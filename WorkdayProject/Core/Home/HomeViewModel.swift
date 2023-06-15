//
//  HomeViewModel.swift
//  WorkdayProject
//
//  Created by user242726 on 6/15/23.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published private(set) var data: [NasaData] = []
    private var pageNumber: Int = 1
    private var limit: Int
    
    
    private let nasaDataService: NasaDataService
    
    init(nasaDataService: NasaDataService = NasaDataService(), limit: Int = 1) {
        self.nasaDataService = nasaDataService
        self.limit = limit
    }
    
    
    func fetch() async {
        
        let url = "https://images-api.nasa.gov/search?q=mars&media_type=image&page=1&page_size=2"
        
        
        do {
            let newData = try await nasaDataService.fetch(url: url)
            self.data.append(contentsOf: newData)
        } catch (let err) {
            print(err)
        }
    }
    
    
}
