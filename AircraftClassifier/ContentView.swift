//
//  ContentView.swift
//  AircraftClassifier
//
//  Created by Doug Holland on 10/14/24.
//

import SwiftUI
import PhotosUI
import CoreML
import Vision

struct ContentView: View {
    @State private var photosPickerItem: PhotosPickerItem? = nil
    
    @State private var image: Image? = nil
    
    @State private var model: AircraftClassifierModel? = nil
    
    private let minumumConfidence: Double = 0.8
    
    @State private var displayClassification: Bool = false
    
    @State private var aircraft: Aircraft? = nil
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                Text("Select a photo")
            }
            .onChange(of: photosPickerItem) {
                Task {
                    image = nil
                    
                    if let data = try? await photosPickerItem?.loadTransferable(type: Data.self) {
                        if let selectedImage = UIImage(data: data) {
                            self.image = Image(uiImage: selectedImage)
                    
                            try await classifyImage(selectedImage)
                        }
                    }
                }
            }
            
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
            }
        }
        .sheet(isPresented: $displayClassification) {
            AircraftClassificationView(aircraft: aircraft, display: $displayClassification)
                .presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.visible)
        }
    }
    
    func classifyImage(_ image: UIImage) async throws {
        let configuration = MLModelConfiguration()
        
        guard let classifier = try? AircraftClassifierModel(configuration: configuration) else {
            fatalError("error: unable to load Create ML aircraft classification model.")
        }
        
        guard let model = try? VNCoreMLModel(for: classifier.model) else {
            fatalError("error: unable to convert Create ML aircraft classification model to CoreML model.")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            if let results = request.results as? [VNClassificationObservation] {
                if let aircraft = Aircraft(rawValue: results.first!.identifier) {
                    self.aircraft = aircraft
                    
                    print("classification: \(aircraft.name)")
                    
                    print("confidence: \(String(describing: results.first?.confidence))")
                    
                    displayClassification = true
                }
            }
        }
        
        let handler = VNImageRequestHandler(cgImage: image.cgImage!)
        
        try handler.perform([request])
    }
}

#Preview {
    ContentView()
}
