//
//  test_imageDataService.swift
//  WorkdayProjectTests
//
//  Created by user242726 on 6/16/23.
//

import XCTest
@testable import WorkdayProject

/// Test Cases for imageViewModel
@MainActor
final class test_imageViewModel: XCTestCase {

    var imageViewModel: ImageViewModel!
    var mockImageDataService: MockImageDataService!
    override func setUpWithError() throws {
        mockImageDataService = MockImageDataService()
        imageViewModel = ImageViewModel(data: helper.instance.testData,
                                        imageDataService: mockImageDataService)
    }

    override func tearDownWithError() throws {
        mockImageDataService = nil
        imageViewModel = nil
        try super.tearDownWithError()
    }

    func test_ImageViewModel_UnableTOFetchImage_ThrowsError() async {
        
        // Given
        mockImageDataService.error = NetworkManager.NetworkingError.connectionTimedOut
        
        // When
        await imageViewModel.fetchImage()
        
        // Then
        XCTAssertTrue(mockImageDataService.fetchExecuted)
        XCTAssertNil(mockImageDataService.stubbedImage)
        XCTAssertFalse(imageViewModel.isLoading)
        XCTAssertNil(imageViewModel.image)
        
    }
    
    func test_ImageViewModel_FetchImageSuccessful_ImageFetched() async {
        // Given
        mockImageDataService.stubbedImage = UIImage()
        
        // When
        await imageViewModel.fetchImage()
        
        //Then
        XCTAssertFalse(imageViewModel.isLoading)
        XCTAssertEqual(imageViewModel.image, mockImageDataService.stubbedImage)
        XCTAssertTrue(mockImageDataService.fetchExecuted)
        
    }

}

class MockImageDataService: ImageDataLayer {
    
    var fetchExecuted: Bool = false
    var stubbedImage: UIImage?
    var error: Error?
    
    func getImage() async throws -> UIImage {
        fetchExecuted = true
        if let err = error {
            throw err
        }
        
        return stubbedImage!
    }
}
