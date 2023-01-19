//
//  ToDo_Using_Core_Data_SwiftUI_App.swift
//  ToDo(Using Core Data+SwiftUI)
//
//  Created by Maximilian on 19.01.2023.
//

import SwiftUI

@main
struct ToDo_Using_Core_Data_SwiftUI_App: App {
    
    let persistentContainer = CoreDataManager.shared.persistenContainer
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
