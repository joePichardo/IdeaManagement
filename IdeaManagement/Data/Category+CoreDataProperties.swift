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
    
    @NSManaged public var colorOneR: Double
    @NSManaged public var colorOneG: Double
    @NSManaged public var colorOneB: Double
    @NSManaged public var colorOneA: Double
    
    @NSManaged public var colorTwoR: Double
    @NSManaged public var colorTwoG: Double
    @NSManaged public var colorTwoB: Double
    @NSManaged public var colorTwoA: Double
    
    static func create(name: String, colorOneR: Double, colorOneG: Double, colorOneB: Double, colorOneA: Double, colorTwoR: Double, colorTwoG: Double, colorTwoB: Double, colorTwoA: Double, in context: NSManagedObjectContext) {
        let newCategory = Category(context: context)
        newCategory.name = name
        newCategory.createdOn = Date()
        newCategory.id = UUID()
        newCategory.colorOneR = colorOneR
        newCategory.colorOneG = colorOneG
        newCategory.colorOneB = colorOneB
        newCategory.colorOneA = colorOneA
        
        newCategory.colorTwoR = colorTwoR
        newCategory.colorTwoG = colorTwoG
        newCategory.colorTwoB = colorTwoB
        newCategory.colorTwoA = colorTwoA
        
    }

}
