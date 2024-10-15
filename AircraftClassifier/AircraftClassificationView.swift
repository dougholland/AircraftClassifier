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
                // display the aircraft specified by the raw value, e.g. F-15, F-16, etc.
                Image(aircraft!.rawValue)
                    .resizable()
                    .scaledToFit()
                
                // display the aircraft name
                Text(aircraft?.name ?? "Unknown Aircraft")
            }
            .frame(maxHeight: 200)
            
            Button("Dismiss") {
                display = false
            }
        }
    }
}

#Preview {
    AircraftClassificationView(aircraft: Aircraft(rawValue: "f16"), display: .constant(true))
}
