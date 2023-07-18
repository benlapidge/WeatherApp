//
//  WeatherAppUITests.swift
//  WeatherAppUITests
//
//  Created by Ben Lapidge on 15/07/2023.
//

import XCTest

class WeatherAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testForecastTableLoaded() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.tables["forecastTable"].exists, "Forecast Table Loaded")
    }

    func testDayDetailTableLoaded() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.tables["forecastTable"].exists, "Forecast Table Loaded")
        app.tables["forecastTable"].cells.element(boundBy: 0).tap()
        XCTAssert(app.tables["hourlyTable"].exists, "Hourly Table Exists")
    }
    
    func testAllHourlyCellsLoaded() throws {
        let app = XCUIApplication()
        app.launch()
        app.tables["forecastTable"].cells.element(boundBy: 0).tap()
        XCTAssert(app.tables["hourlyTable"].exists, "Hourly Table Exists")
        XCTAssert(app.tables["hourlyTable"].cells.count == 24, "All hours loaded")
    }
    
}
