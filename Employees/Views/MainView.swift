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
    @State private var searchText = ""
    
    @State private var navigateToStatistics = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                EmployeeListView(sortOption: sortOption, searchString: searchText)
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
            .navigationDestination(isPresented: $navigateToStatistics) {
                StatisticsView()
            }
            .searchable(text: $searchText)
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOption) {
                        ForEach(SortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.inline)
                }
                
                Button(action: {
                    navigateToStatistics = true
                }) {
                    Label("Statistics", systemImage: "chart.line.uptrend.xyaxis")
                }
            }
            
        }
    }
    
    private func addEmployee() {
        let employee = Employee()
        modelContext.insert(employee)
        path = [employee]
    }
}

#Preview {
    MainView()
}
