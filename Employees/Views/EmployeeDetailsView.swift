//
//  EmployeeDetailsView.swift
//  Employees
//
//  Created by Dino Gačević on 15. 10. 24.
//

import SwiftData
import SwiftUI

struct EmployeeDetailsView: View {
    @Bindable var employee: Employee
    @State private var isPickerPresented: Bool = false
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("First name")
                        .foregroundStyle(.gray)
                    Spacer()
                    TextField("First name", text: $employee.firstName)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Last name")
                        .foregroundStyle(.gray)
                    Spacer()
                    TextField("Last name", text: $employee.lastName)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Age")
                        .foregroundStyle(.gray)
                    Spacer()
                    HStack {
                        Text(employee.age.description)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.onTapGesture {
                        isPickerPresented = true
                    }
                }
            }
            Section("Gender") {
                Picker("Gender", selection: $employee.gender) {
                    ForEach(Gender.allCases) { gender in
                        Text(gender.value).tag(gender)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Employee details")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $isPickerPresented) {
            NavigationView {
                VStack {
                    Picker("Age", selection: $employee.age) {
                        ForEach(18..<100, id: \.self) { age in
                            Text("\(age)").tag(age)
                        }
                    }
                    .pickerStyle(.wheel)
                    .labelsHidden()
                    .padding()
                }
                .navigationBarTitle("Select Your Age", displayMode: .inline)
                .toolbar {
                    // Add the "Done" button in the top-right corner
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPickerPresented = false
                        }
                    }
                }
            }
            .presentationDetents([.fraction(0.3)]) // Adjust the picker sheet height if needed
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Employee.self, configurations: config)
        let example = Employee(firstName: "First name", lastName: "Last name", age: 28, gender: .male)
        return EmployeeDetailsView(employee: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
