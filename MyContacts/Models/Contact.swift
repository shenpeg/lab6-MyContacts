//
//  Contact.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import SwiftUI

class Contact: Identifiable {
  
  // MARK: Properties
  var name: String = "Batman"
  var email: String?
  var phone: String?
  var picture: Image?

  init(name: String = "Batman", email: String? = nil, phone: String? = nil, imagePath: String? = nil) {
    self.name = name
    self.email = email
    self.phone = phone
    if let image = imagePath {   // Pass the name of an xcasset image
      self.picture = Image(image)
    }
  }

  func displayEmail() -> String {
    return email ?? "n/a"
  }

  func displayPhone() -> String {
    return phone ?? "n/a"
  }
}
