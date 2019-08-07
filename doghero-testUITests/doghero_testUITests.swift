//
//  doghero_testUITests.swift
//  doghero-testUITests
//
//  Created by Mateus Kamoei on 07/08/19.
//  Copyright © 2019 doghero. All rights reserved.
//

import XCTest

class doghero_testUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    // Tests if the favorite image is changing correctly
    func testFavoriteToggle() {
        let tablesQuery = XCUIApplication().tables
        let favoriteButton = tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Eduardo")/*[[".cells.containing(.staticText, identifier:\"R$55\")",".cells.containing(.staticText, identifier:\"Parque Chacabuco\")",".cells.containing(.staticText, identifier:\"Eduardo\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["icon heart unfilled"]
        favoriteButton.tap()
        XCTAssertFalse(favoriteButton.exists)
        let unfavoriteButton = tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Eduardo")/*[[".cells.containing(.staticText, identifier:\"R$55\")",".cells.containing(.staticText, identifier:\"Parque Chacabuco\")",".cells.containing(.staticText, identifier:\"Eduardo\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["icon heart filled"]
        XCTAssertTrue(unfavoriteButton.exists)
        unfavoriteButton.tap()
        XCTAssertTrue(favoriteButton.exists)
        XCTAssertFalse(unfavoriteButton.exists)
    }

}
