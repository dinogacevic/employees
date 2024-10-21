//
//  StatisticsView.swift
//  Employees
//
//  Created by Dino Gačević on 18. 10. 24.
//

import Charts
import SwiftData
import SwiftUI

struct AgeCount: Identifiable {
    var id: Int { age }
    var age: Int
    var count: Int
}

struct GenderCount: Identifiable {
    var id: String { gender.rawValue }
    var gender: Gender
    var count: Int
}

struct StatisticsView: View {
    @Query var employees: [Employee]
    
    private var averageAge: Double {
        let ages = employees.map { $0.age }
        guard !ages.isEmpty else { return 0 }
        let sum = ages.reduce(0, +)
        let average = Double(sum) / Double(ages.count)
        let roundedToOneDecimal = round(average * 10) / 10
        return roundedToOneDecimal
    }
    
    private var ageCounts: [AgeCount] {
        let grouped = Dictionary(grouping: employees, by: { $0.age })
        return grouped.map { age, employees in
            AgeCount(age: age, count: employees.count)
        }
        .sorted(by: { $0.age < $1.age })
    }
    
    private var genderCounts: [GenderCount] {
        let grouped = Dictionary(grouping: employees, by: { $0.gender })
        let counts = grouped.map { gender, employees in
            GenderCount(gender: gender, count: employees.count)
        }
        
        // Sort so that Male comes before Female
        return counts.sorted { $0.gender == .male && $1.gender == .female }
    }
    
    private var genderColors: [Gender: Color] {
        return [
            .female: Color.red,
            .male: Color.blue
        ]
    }
    
    var body: some View {
        List {
            Section {
                VStack {
                    CenteredText(text: "Average age of employees", font: .title2)
                    CenteredText(text: "\(averageAge)", font: .title, foregroundColor: .blue)
                }
                .padding()
            }
            
            Section {
                VStack {
                    CenteredText(text: "Age distribution", font: .title2)
                    Chart {
                        ForEach(ageCounts) { ageCount in
                            BarMark(
                                x: .value("Age", ageCount.age),
                                y: .value("Count", ageCount.count)
                            )
                            .foregroundStyle(.blue)
                        }
                    }
                }
                .padding()
            }
            
            Section {
                VStack {
                    CenteredText(text: "Gender distribution", font: .title2)
                    Chart(genderCounts, id: \.gender.rawValue) { item in
                        SectorMark(
                          angle: .value("Count", item.count)
                        )
                        .foregroundStyle(genderColors[item.gender] ?? .blue)
                        .annotation(position: .overlay) {
                            let percentage = Double(item.count) / Double(employees.count)
                            Text("\(String(format: "%.1f", percentage))%")
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                        }

                    }
                    .frame(height: 200)
                    
                    HStack(spacing: 16) {
                        ForEach(genderColors.keys.sorted(by: { $0 == .male && $1 == .female }), id: \.self) { gender in
                            HStack {
                                Circle()
                                    .fill(genderColors[gender] ?? .blue)
                                    .frame(width: 12, height: 12)
                                Text(gender.rawValue.capitalized)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
            }
        }
        .navigationTitle("Employee Statistics")
    }
}

#Preview {
    StatisticsView()
}
