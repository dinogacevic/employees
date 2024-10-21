//
//  MainViewTests.swift
//  EmployeesTests
//
//  Created by Dino Gačević on 19. 10. 24.
//

@testable import Employees
import SwiftUI
import XCTest

final class MainViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    func testAddEmployeeButton() {
        let addButton = app.buttons["Add Employee"]
        XCTAssertTrue(addButton.exists)

        addButton.tap()

        let employeeCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(employeeCell.exists)
    }
    
    func testSortMenu() {
        let sortMenu = app.navigationBars.buttons["Sort"]
        XCTAssertTrue(sortMenu.exists)
        sortMenu.tap()

        let firstSortOption = app.pickers.staticTexts["Name"]
        XCTAssertTrue(firstSortOption.exists)
        firstSortOption.tap()

        // Validate that the sorting has occurred (you may need to implement additional validation)
        // For example, check if the first cell matches expected sorted order
        let firstEmployeeCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstEmployeeCell.exists)
        // More assertions can be made here based on sorting
    }
    
    func testSearchFunctionality() {
        let addButton = app.buttons["Add Employee"]
        addButton.tap()
        
        let searchField = app.searchFields.firstMatch
        XCTAssertTrue(searchField.exists)
        searchField.tap()
        searchField.typeText("Tom Kittycat")

        let filteredCell = app.tables.cells.containing(.staticText, identifier: "Tom Kittycat").firstMatch
        XCTAssertTrue(filteredCell.exists)
    }
}
