//
//  MainView.swift
//  Employees
//
//  Created by Dino Gačević on 15. 10. 24.
//

import SwiftData
import SwiftUI

struct MainView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [Employee]()
    @State private var sortOption = SortOption.name
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                EmployeeListView(sortOption: sortOption)
                    .padding(.bottom, 60)
                
                VStack {
                    Spacer()
                    Button(action: addEmployee) {
                        Text("Add Employee")
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.white)
                    .font(.headline)
                    .background(Color(red: 86/255, green: 100/255, blue: 245/255))
                    .clipShape(.buttonBorder)
                    .padding()
                }
            }
            .navigationTitle("Employees")
            .navigationDestination(for: Employee.self, destination: EmployeeDetailsView.init)
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOption) {
                        ForEach(SortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.inline)
                }
                
                NavigationLink {
                    
                } label: {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .foregroundStyle(.blue)
                }
//                Button("Statistics", systemImage: "chart.line.uptrend.xyaxis", action: showStatistics)
            }
            
        }
    }
    
    private func addEmployee() {
        let employee = Employee()
        modelContext.insert(employee)
        path = [employee]
    }
    
    private func showStatistics() {
        
    }
}

#Preview {
    MainView()
}
