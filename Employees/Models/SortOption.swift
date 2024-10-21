//
//  SortOption.swift
//  Employees
//
//  Created by Dino Gačević on 16. 10. 24.
//

import Foundation

enum SortOption: String, CaseIterable, Identifiable {
    case name = "Name"
    case age = "Age"
    
    var id: String { self.rawValue }
    
    var sortDescriptors: [SortDescriptor<Employee>] {
        switch self {
        case .name:
            return [
                SortDescriptor(\Employee.firstName),
                SortDescriptor(\Employee.lastName),
                SortDescriptor(\Employee.age)
            ]
        case .age:
            return [
                SortDescriptor(\Employee.age),
                SortDescriptor(\Employee.firstName),
                SortDescriptor(\Employee.lastName)
            ]
        }
    }
}
