//
//  ImagePicker.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

  @Binding var isShown: Bool
  @Binding var image: UIImage?

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    
  }

  func makeCoordinator() -> ImagePickerCordinator {
    return ImagePickerCordinator(isShown: $isShown, image: $image)
  }

  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }
}
