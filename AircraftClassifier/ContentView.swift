//
//  ContentView.swift
//  AircraftClassifier
//
//  Created by Doug Holland on 10/14/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var photosPickerItem: PhotosPickerItem? = nil
    
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                Text("Select a photo")
            }
            .onChange(of: photosPickerItem) {
                Task {
                    // load the selected image.
                    if let data = try? await photosPickerItem?.loadTransferable(type: Data.self) {
                        if let selectedImage = UIImage(data: data) {
                            self.image = Image(uiImage: selectedImage)
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
    }
    
}

#Preview {
    ContentView()
}
