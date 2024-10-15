//
//  AircraftClassificationView.swift
//  AircraftClassifier
//
//  Created by Doug Holland on 10/14/24.
//

import SwiftUI

struct AircraftClassificationView: View {
    var message: String? = nil
    @Binding var display: Bool
    
    var body: some View {
        VStack {
            Button("Dismiss") {
                display = false
            }
        }
    }
}

#Preview {
    AircraftClassificationView(message: "Unknown", display: .constant(true))
}
