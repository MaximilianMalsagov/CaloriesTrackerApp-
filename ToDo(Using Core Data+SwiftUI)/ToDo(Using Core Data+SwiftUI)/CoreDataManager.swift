//
//  CoreDataManager.swift
//  ToDo(Using Core Data+SwiftUI)
//
//  Created by Maximilian on 19.01.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    
    let persistenContainer : NSPersistentContainer
    static let shared : CoreDataManager = CoreDataManager()
    private init() {
        
        
        persistenContainer = NSPersistentContainer(name: "ToDoModel")
        persistenContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize CoreData\(error)")
            }
        }
    }
}
