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
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testAddEmployeeButtonExists() {
        let addEmployeeButton = app.buttons["Add Employee"]
        XCTAssertTrue(addEmployeeButton.exists, "The app should contain Add Employee button")
    }
}
