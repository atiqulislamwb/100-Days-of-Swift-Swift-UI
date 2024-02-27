//
//  OtherView.swift
//  Instafilter
//
//  Created by Atiqul Islam on 27/2/24.
//

import SwiftUI
import PhotosUI
import StoreKit

struct OtherView: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    @Environment(\.requestReview) var requestReview
    var body: some View {
        VStack {
            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
            Button("Leave a review") {
                requestReview()
            }
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
      
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images) {
                Label("Select a picture", systemImage: "photo")
            }
            Spacer()
            }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()

                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    OtherView()
}
