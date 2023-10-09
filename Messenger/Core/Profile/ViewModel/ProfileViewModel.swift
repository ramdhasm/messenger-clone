//
//  ProfileViewModel.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-08.
//

import Foundation
import PhotosUI
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                try await loadImage()
            }
        }
    }
    
    @Published var profileImage: Image?
    
    func loadImage() async throws {
        guard let item = selectedItem else {return}
        guard let imageData = try await item.loadTransferable(type: Data.self) else {return}
        guard let image = UIImage(data: imageData) else {return}
        self.profileImage = Image(uiImage: image)
    }
    
}
