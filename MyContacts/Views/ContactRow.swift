//
//  ContactRow.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import SwiftUI

//A simple view that takes a Contact object & displays the contact's image (if available) & the contact's name.

struct ContactRow: View {
    var contact: Contact

    var body: some View {
        HStack {
            contact.picture?
              .resizable()
              .frame(width: 50, height: 50)
              .cornerRadius(25)
            Text(contact.name).font(.headline)
            Spacer()
        }
    }
}
