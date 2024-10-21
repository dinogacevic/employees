//
//  EmployeesTests.swift
//  EmployeesTests
//
//  Created by Dino Gačević on 19. 10. 24.
//

@testable import Employees
import XCTest

final class EmployeeTests: XCTestCase {
    func testEmployeeInitializationWithDefaultValues() {
        let employee = Employee()
        
        XCTAssertEqual(employee.firstName, "Tom", "Default first name should be 'Tom'")
        XCTAssertEqual(employee.lastName, "Kittycat", "Default last name should be 'Kittycat'")
        XCTAssertEqual(employee.age, 20, "Default age should be 20")
        XCTAssertEqual(employee.gender, .male, "Default gender should be male")
    }
    
    func testEmployeeInitializationWithCustomValues() {
        let employee = Employee(firstName: "Jane", lastName: "Doe", age: 30, gender: .female)
        
        XCTAssertEqual(employee.firstName, "Jane", "First name should be 'Jane'")
        XCTAssertEqual(employee.lastName, "Doe", "Last name should be 'Doe'")
        XCTAssertEqual(employee.age, 30, "Age should be 30")
        XCTAssertEqual(employee.gender, .female, "Gender should be female")
    }
    
    func testEmployeeFirstNameUpdate() {
        var employee = Employee(firstName: "John", lastName: "Doe", age: 40, gender: .male)
        
        employee.firstName = "Jane"
        XCTAssertEqual(employee.firstName, "Jane", "First name should be updated to Jane")
    }
    
    func testEmployeeAgeUpdate() {
        var employee = Employee(firstName: "John", lastName: "Doe", age: 40, gender: .male)
        
        employee.age = 41
        XCTAssertEqual(employee.age, 41, "Age should be updated to 41")
    }
    
    func testEmployeeGenderUpdate() {
        var employee = Employee(firstName: "Sam", lastName: "Brown", age: 22, gender: .male)
        
        employee.gender = .female
        XCTAssertEqual(employee.gender, .female, "Gender should be updated to female")
    }
}
