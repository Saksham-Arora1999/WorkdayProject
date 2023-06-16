//
//  test_UtilityFunctions.swift
//  WorkdayProjectTests
//
//  Created by user242726 on 6/15/23.
//

import XCTest
@testable import WorkdayProject


/// Sample test cases for UtilityFunctions
final class test_UtilityFunctions: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UtilityFunctions_CorrectFormatInput_DateInFormat() {
        
        // Given
        let expected = "May 29, 2019"
        
        // when
        let result = UtilityFunctions.transformDate(dateString: "2019-05-30T00:00:00Z")
        
        // Then
        XCTAssertEqual(result, expected)
        
    }
    
    func test_UtilityFunctions_IncorrectFormatInput_NotAvailaible() {
        
        // Given
        let expected = "Not Available"
        
        // When
        let result = UtilityFunctions.transformDate(dateString: "2019-31-05")
        
        // then
        XCTAssertEqual(expected, result)
    }

}
