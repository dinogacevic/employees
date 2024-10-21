//
//  CenteredText.swift
//  Employees
//
//  Created by Dino Gačević on 18. 10. 24.
//

import SwiftUI

struct CenteredText: View {
    var text: String
    var font: Font
    var foregroundColor: Color? = nil

    var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(foregroundColor)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
