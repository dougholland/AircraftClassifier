//
//  AircraftClassificationView.swift
//  AircraftClassifier
//
//  Created by Doug Holland on 10/14/24.
//

import SwiftUI

import Vision

struct AircraftClassificationView: View {
    var aircraft: Aircraft? = nil
    
    var confidence: VNConfidence = 0.0
    
    @Binding var display: Bool
    
    var body: some View {
        VStack {
            HStack {
                // display the aircraft specified by the raw value, e.g. F-15, F-16, etc.
                Image(aircraft!.rawValue)
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    // display the aircraft name
                    Text(aircraft?.name ?? "Unknown Aircraft")
                    
                    // display the model classification confidence.
                    Text("Confidence: \(confidence * 100, specifier: "%.2f")%")
                }
            }
            
            Button("Dismiss") {
                display = false
            }
        }
        .frame(maxHeight: 200)
    }
}

#Preview {
    AircraftClassificationView(aircraft: Aircraft(rawValue: "f16"), confidence: 0.8, display: .constant(true))
}
