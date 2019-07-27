//
//  CategoryStore.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/22/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

@objc(CategoryStore)
class CategoryStore: NSObject, BindableObject {
    
    // MARK: Private Properties
    private let persistenceManager = PersistenceManager()
    
    private lazy var fetchedResultsController: NSFetchedResultsController<Category> = {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "createdOn", ascending: false)]
        
        let fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.persistenceManager.managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    public var categories: [Category] {
        return fetchedResultsController.fetchedObjects ?? []
    }
    
    // MARK: Public Properties
    
    let willChange = PassthroughSubject<CategoryStore, Never>()
    
    // MARK: Object Lifecycle
    
    override init() {
        super.init()
        fetchCategories()
    }
    
    // MARK: Public Methods
    
    public func create(name: String, colorOneR: Double, colorOneG: Double, colorOneB: Double, colorOneA: Double, colorTwoR: Double, colorTwoG: Double, colorTwoB: Double, colorTwoA: Double) {
        Category.create(name: name, colorOneR: colorOneR, colorOneG: colorOneG, colorOneB: colorOneB, colorOneA: colorOneA, colorTwoR: colorTwoR, colorTwoG: colorTwoG, colorTwoB: colorTwoB, colorTwoA: colorTwoA, in: persistenceManager.managedObjectContext)
        saveChanges()
    }
    
    public func delete() {
        if categories.count > 0 {
            self.persistenceManager.managedObjectContext.delete(categories[0])
            saveChanges()
        }
    }
    
    public func deleteById(id: UUID) {        
        var filteredId: [Category] {
            return self.categories.filter { $0.id == id }
        }
        
        for category in filteredId {
            self.persistenceManager.managedObjectContext.delete(category)
        }
        
        saveChanges()
    }
    
    // MARK: Private Methods
    
    private func fetchCategories() {
        do {
            try fetchedResultsController.performFetch()
//            dump(fetchedResultsController.sections)
        } catch {
            fatalError()
        }
    }
    
    private func saveChanges() {
        guard persistenceManager.managedObjectContext.hasChanges else { return }
        do {
            try persistenceManager.managedObjectContext.save()
        } catch { fatalError() }
    }
}

// MARK: TodoStore + NSFetchedResultsControllerDelegate
extension CategoryStore: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        willChange.send(self)
    }
}

