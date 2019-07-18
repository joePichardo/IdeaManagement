//
//  Category+CoreDataProperties.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 7/17/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var createdOn: Date
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    
    static func create(name: String, in context: NSManagedObjectContext) {
        let newCategory = Category(context: context)
        newCategory.name = name
        newCategory.createdOn = Date()
        newCategory.id = UUID()
    }

}
