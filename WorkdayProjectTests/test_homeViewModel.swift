//
//  test_homeViewModel.swift
//  WorkdayProjectTests
//
//  Created by user242726 on 6/16/23.
//

import XCTest
@testable import WorkdayProject

@MainActor
final class test_homeViewModel: XCTestCase {

    var homeViewModel: HomeViewModel!
    var mockNasaDataService: MockNasaDataService!
    override func setUpWithError() throws {
        
        mockNasaDataService = MockNasaDataService()
        homeViewModel = HomeViewModel(nasaDataService: mockNasaDataService)
        
    }

    override func tearDownWithError() throws {
        
        mockNasaDataService = nil
        homeViewModel = nil
        try super.tearDownWithError()
        
    }
    
    func test_homeViewModel_searchTextEmpty_NoCallToFetch() async {
        
        // Given
        homeViewModel.searchText = ""
        
        //when
        await homeViewModel.fetch()
        
        //Then
        XCTAssertEqual(mockNasaDataService.fetchCalled, 0)
        
        
    }
    
    func test_homeViewModel_initialFetchGivesError_ThrowsError() async {
        // Then
        mockNasaDataService.error = NetworkManager.NetworkingError.badServerRespone
        homeViewModel.searchText = "lorem"
        
        // When
        await homeViewModel.fetch()
        
        //Then
        XCTAssertEqual(mockNasaDataService.fetchCalled, 1)
        XCTAssertEqual(homeViewModel.data, [])
        
        
    }
    
    func test_homeViewModel_initialFetchSuccessful_fetchCalledShouldBeOne() async {
        
        // Given
        homeViewModel.searchText = "lorem"
        mockNasaDataService.data = [helper.instance.testData]
        
        // When
        await homeViewModel.fetch()
        
        //Then
        XCTAssertEqual(mockNasaDataService.fetchCalled, 1)
        XCTAssertEqual(homeViewModel.data, [helper.instance.testData])
        
    }
    
    func test_homeViewModel_loadMoreData_fetchShouldBeCalledTwice() async {
        // Given
        homeViewModel.searchText = "lorem"
        mockNasaDataService.data = [helper.instance.testData]
        
        // When
        await homeViewModel.fetch()
        await homeViewModel.loadMoreData()
        
        //Then
        XCTAssertEqual(mockNasaDataService.fetchCalled, 2)
        XCTAssertEqual(homeViewModel.data, [helper.instance.testData, helper.instance.testData])
        
        
    }
    
    func test_homeViewModel_searchTextGoesBlankComesAgain_NoError() async {
        // Given
        homeViewModel.searchText = "lorem"
        mockNasaDataService.data = [helper.instance.testData]
        
        // When
        await homeViewModel.fetch()
        await homeViewModel.loadMoreData()
        
        //Then
        XCTAssertEqual(mockNasaDataService.fetchCalled, 2)
        XCTAssertEqual(homeViewModel.data, [helper.instance.testData, helper.instance.testData])
        
        //Then
        homeViewModel.searchText = ""
        await homeViewModel.fetch()
        
        
        //Asssertion
        XCTAssertEqual(mockNasaDataService.fetchCalled, 2)
        XCTAssertEqual(homeViewModel.data, [])
        
        // Then
        homeViewModel.searchText = "lorem"
        
        // Then
        await homeViewModel.fetch()
        await homeViewModel.loadMoreData()
        
        //Assertion
        XCTAssertEqual(mockNasaDataService.fetchCalled, 4)
        XCTAssertEqual(homeViewModel.data, [helper.instance.testData, helper.instance.testData])
        
        
    }

    

}

class MockNasaDataService: NasaDataLayer {
    var fetchCalled = 0
    var data: [NasaData]?
    var error: NetworkManager.NetworkingError?
    func fetch(url: String) async throws -> [NasaData] {
        fetchCalled += 1
        if let err = error {
            throw err
        }
        
        return data!
    }
}
