//
//  EmployeesApp.swift
//  Employees
//
//  Created by Dino Gačević on 15. 10. 24.
//

import SwiftData
import SwiftUI

@main
struct EmployeesApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Employee.self)
    }
}
