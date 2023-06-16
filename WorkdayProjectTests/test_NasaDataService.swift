//
//  test_NasaDataService.swift
//  WorkdayProjectTests
//
//  Created by user242726 on 6/16/23.
//

import XCTest
@testable import WorkdayProject


/// Sample test cases for NasaDataService
final class test_NasaDataService: XCTestCase {

    var nasaDataService: NasaDataService!
    var mockNetworkManager: MockNetworkingManager!
    
    override func setUpWithError() throws {
        mockNetworkManager = MockNetworkingManager()
        nasaDataService = NasaDataService(networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        mockNetworkManager = nil
        nasaDataService = nil
        try super.tearDownWithError()
    }

    func test_NasaDataService_badUrlPassed_throwsError() async {
        //Given
        let url = ""
        
        
        do {
            // When
            let _ = try await nasaDataService.fetch(url: url)
            
            XCTFail("Error")
        } catch {
            XCTAssertEqual(error.localizedDescription, "Broken URL")
        }
    }
    
    func test_NasaDataService_goodUrlPassed_dataReceived() async throws {
        
        // Given
        let url = "https://images-api.nasa.gov/search?q=mars&media_type=image"
        mockNetworkManager.stubbedData = helper.instance.APIResponse
        
        // when
        let data = try JSONDecoder().decode(APIResponse.self, from: helper.instance.APIResponse)
        let expected = data.collection.items.map {  NasaData(detail: $0.data[0], itemLink: $0.links[0]) }
        let result = try await nasaDataService.fetch(url: url)
        
        
        // then
        XCTAssertEqual(result, expected)
    }
    
    func test_NasaDataService_goodURLPassed_BadDataReeceived() async {
        
        // Given
        let url = " https://images-api.nasa.gov/search?q=mars&media_type=image"
        
        // Then
        mockNetworkManager.stubbedData = Data()
        
        do {
            let _ = try await nasaDataService.fetch(url: url)
            XCTFail("Error if the control of flow reaches here")
        } catch {
            
        }
    }
    

}

class MockNetworkingManager: NetworkLayer {
    var stubbedData: Data? = nil
    let error: NetworkManager.NetworkingError = .brokenURL
    func fetch(url: String) async throws -> Data {
        guard let _ = URL(string: url)
        else{throw error}
        
        return stubbedData!
    }
}
