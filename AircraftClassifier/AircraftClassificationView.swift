//
//  AircraftClassificationView.swift
//  AircraftClassifier
//
//  Created by Doug Holland on 10/14/24.
//

import SwiftUI

struct AircraftClassificationView: View {
    var aircraft: Aircraft? = nil
    @Binding var display: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image("F-22")
                    .resizable()
                    .scaledToFit()
                
                Text("F-22 Raptor")
            }
            .frame(maxHeight: 200)
            
            Button("Dismiss") {
                display = false
            }
        }
    }
}

#Preview {
    AircraftClassificationView(aircraft: Aircraft(rawValue: "f22"), display: .constant(true))
}
