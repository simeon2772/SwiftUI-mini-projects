//
//  UploadPostViewModel.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 10.06.24.
//

import SwiftUI
import PhotosUI
import Observation

@Observable
class UploadPostViewModel {
    var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
    }
}
