//
//  Gender.swift
//  Employees
//
//  Created by Dino Gačević on 15. 10. 24.
//

import Foundation

enum Gender: String, Codable, Identifiable, CaseIterable {
    case male, female
    
    var value: String { rawValue.capitalized }
    
    var id: Self { self }
}
