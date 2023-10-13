//
//  ImagePickerCoordinator.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import UIKit
import SwiftUI

class ImagePickerCordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  @Binding var isShown: Bool
  @Binding var image: UIImage?

  init(isShown: Binding<Bool>, image: Binding<UIImage?>) {
    _isShown = isShown
    _image = image
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    isShown = false
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    isShown = false
  }
}
