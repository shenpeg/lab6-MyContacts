//
//  ViewModel.swift
//  MyContacts
//
//  Created by /peggy on 10/13/23.
//

import Photos
import SwiftUI
import UIKit
import CoreData

class ViewModel: ObservableObject {
  @Published var contacts = [Contact]()
  let appDelegate: AppDelegate = AppDelegate()

  func saveContact(name: String, phone: String?, email: String?, picture: UIImage?) {
    let newContact = Contact()
    newContact.name = name
    if let phoneTemp = phone {
      if phoneTemp != "" {
        newContact.phone = phoneTemp
      } else {
        newContact.phone = nil
      }
    }
    if let emailTemp = email {
      if emailTemp != "" {
        newContact.email = emailTemp
      } else {
        newContact.email = nil
      }
    }
    if let pictureTemp = picture {
      newContact.picture = Image(uiImage: pictureTemp)
    }
    let context = appDelegate.persistentContainer.viewContext
    if let entity = NSEntityDescription.entity(forEntityName: "Person", in: context) {
      let newUser = NSManagedObject(entity: entity, insertInto: context)
      newUser.setValue(newContact.name, forKey: "name")
      newUser.setValue(newContact.phone, forKey: "phone")
      newUser.setValue(newContact.email, forKey: "email")
      if let pic = picture {
        newUser.setValue(pic.pngData(), forKey: "picture")
      }
      do {
        try context.save()
      } catch {
        NSLog("[Contacts] ERROR: Failed to save Contact to CoreData with name: \(newContact.name)")
      }
    self.contacts.append(newContact)
    }
  }
  
  func fetchContacts() {
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
    request.returnsObjectsAsFaults = false
    do {
      let result = try context.fetch(request)
      for data in result as! [NSManagedObject] {
        let newContact = Contact()
        newContact.name = data.value(forKey: "name") as? String ?? ""
        newContact.email = data.value(forKey: "email") as? String
        newContact.phone = data.value(forKey: "phone") as? String
        if let uiImageNSData: NSData = data.value(forKey: "picture") as? NSData {
          newContact.picture = Image(uiImage: UIImage(data: uiImageNSData as Data, scale: 1.0)!)
        }
        contacts.append(newContact)
        NSLog("[Contacts] loaded Contact with name: \(data.value(forKey: "name") as! String) from CoreData")
      }
    } catch {
      NSLog("[Contacts] ERROR: was unable to load Contacts from CoreData")
    }
  }
  
  func updateContacts() {
    contacts.removeAll()
    fetchContacts()
  }
  
  func deleteContact(atOffsets: IndexSet) {
      let context = appDelegate.persistentContainer.viewContext
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
      request.returnsObjectsAsFaults = false
      
      for index in atOffsets {
          let contact: Contact = contacts[index]
          
          do {
              let result = try context.fetch(request)
              for data in result as! [NSManagedObject] {
                  if let name = data.value(forKey: "name") as? String, name == contact.name {
                      context.delete(data)
                      try context.save()
                  }
              }
          } catch {
              print(error.localizedDescription)
          }
      }
      
      contacts.remove(atOffsets: atOffsets)
  }
  
  
}
