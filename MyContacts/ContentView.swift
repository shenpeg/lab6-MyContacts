//
//  ContentView.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

  @ObservedObject var viewModel = ViewModel()

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.contacts) { contact in
          NavigationLink(destination: ContactDetail(contact: contact)) {
            ContactRow(contact: contact)
          }
        }
        .onDelete(perform: delete)
      }
      .onAppear(perform: {
        self.viewModel.updateContacts()
      })
      .navigationBarTitle("Contacts")
      .navigationBarItems(trailing:
        NavigationLink(destination: AddContact(viewModel: viewModel)) {
            Image(systemName: "plus")
        }
      )
    }
  }
  
  func delete(at offsets: IndexSet) {
    viewModel.deleteContact(atOffsets: offsets)
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
