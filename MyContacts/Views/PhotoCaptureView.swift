//
//  PhotoCaptureView.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import SwiftUI

struct PhotoCaptureView: View {

  @Binding var showImagePicker: Bool
  @Binding var image: UIImage?

  var body: some View {
    ImagePicker(isShown: $showImagePicker, image: $image)
  }
}
