//
//  PersistenceManager.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 7/14/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class PersistenceManager {
    lazy var managedObjectContext: NSManagedObjectContext = { self.persistentContainer.viewContext }()
    
    lazy var persistentContainer: NSPersistentContainer  = {
        let container = NSPersistentContainer(name: "IdeaManagement")
        container.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
        return container
    }()
}
