//
//  EmployeeListingView.swift
//  Employees
//
//  Created by Dino Gačević on 16. 10. 24.
//

import SwiftData
import SwiftUI

struct EmployeeListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var employees: [Employee]
    
    var body: some View {
        List {
            ForEach(employees) { employee in
                Section {
                    NavigationLink(value: employee) {
                        VStack(alignment: .leading) {
                            Text(employee.firstName + " " + employee.lastName)
                            
                            Text("Gender: \(employee.gender.value)")
                            
                            Text("Age: \(employee.age)")
                        }
                    }
                }
            }
            .onDelete(perform: deleteEmployee)
        }
        .listSectionSpacing(.compact)
        .preferredColorScheme(.dark)
    }
    
    init(sortOption: SortOption) {
        _employees = Query(sort: sortOption.sortDescriptors)
    }
    
    func deleteEmployee(_ indexSet: IndexSet) {
        for index in indexSet {
            let employee = employees[index]
            modelContext.delete(employee)
        }
    }
}

#Preview {
    EmployeeListView(sortOption: .name)
}
