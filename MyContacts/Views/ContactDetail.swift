//
//  ContactDetail.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import SwiftUI

struct ContactDetail: View {

  var contact: Contact
  let width = UIScreen.main.bounds.width * 0.75

  var body: some View {
    
    VStack {
      contact.picture?
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .frame(width: 200, height: 200, alignment: .center)
        .padding()
      
      HStack {
        Text("phone:").fontWeight(.bold).padding(.leading)
        Spacer()
        Text(contact.displayPhone()).padding(.trailing)
      }.padding()
      
      HStack {
        Text("email:").fontWeight(.bold).padding(.leading)
        Spacer()
        Text(contact.displayEmail()).padding(.trailing)
      }.padding()

      Spacer()
    }.navigationBarTitle(contact.name)
    
  }
  
}

