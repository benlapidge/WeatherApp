//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Ben Lapidge on 15/07/2023.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testColorArrayIsReturned() throws {
        var expected : [CGColor]
        expected = Utilities.shared.getColorArrayFromCondition(with: 1000)
        XCTAssert(expected == Utilities.shared.sunny, "Incorrect CGColor array returned")
    }

}
