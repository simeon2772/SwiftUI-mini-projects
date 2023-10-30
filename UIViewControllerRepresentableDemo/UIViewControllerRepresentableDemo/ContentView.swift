//
//  ContentView.swift
//  UIViewControllerRepresentableDemo
//
//  Created by Simeon Ivanov on 30.10.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showImagePickerView = false
    @State private var selectedImage: UIImage?
    @State private var image = UIImage()
    
    var body: some View {
        VStack {
            Text("Choose an Image!")
                .font(.largeTitle)
                .padding()
            Spacer()
            imageView
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    showImagePickerView = true
                }
                .padding()
            Spacer()
            Spacer()
        }
        .sheet(isPresented: $showImagePickerView){
            ImagePickerView(selectedImage: $selectedImage)
        }
    }
    
    var imageView: Image {
        guard let selectedImage = selectedImage else {
            return Image(systemName: "photo")
        }
        return Image(uiImage: selectedImage)
    }
}

#Preview {
    ContentView()
}
