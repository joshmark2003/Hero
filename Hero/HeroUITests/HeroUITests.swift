//
//  HeroUITests.swift
//  HeroUITests
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import XCTest

class HeroUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    private func showActionSheet() {
        XCTAssert(app.navigationBars["Items"].buttons["Sort"].exists)
        let sortButton = app.navigationBars["Items"].buttons["Sort"]
        sortButton.tap()
    }
    
    func testSorting() {
        
        XCTAssert(app.navigationBars["Items"].exists)

        sleep(3)

        app.swipeUp()
        app.swipeDown()
        
        showActionSheet()
        let sheetsQuery = app.sheets
        sheetsQuery.buttons["Cancel"].tap()
        
        showActionSheet()
        sheetsQuery.buttons["Name ascending"].tap()
        
        showActionSheet()
        sheetsQuery.buttons["Name descending"].tap()
    }
}
