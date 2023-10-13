//
//  MyContactsApp.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import SwiftUI

@main
struct MyContactsApp: App {
  //let persistenceController = PersistenceController.shared
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
      WindowGroup {
          ContentView()
      }
  }
}
