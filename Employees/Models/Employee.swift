//
//  Employee.swift
//  Employees
//
//  Created by Dino Gačević on 15. 10. 24.
//

import Foundation
import SwiftData

@Model
class Employee {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: Gender
    
    init(firstName: String = "Tom", lastName: String = "Kittycat", age: Int = 20, gender: Gender = .male) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
}
