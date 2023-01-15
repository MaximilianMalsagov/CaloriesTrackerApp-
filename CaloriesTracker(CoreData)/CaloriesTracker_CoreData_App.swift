//
//  CaloriesTracker_CoreData_App.swift
//  CaloriesTracker(CoreData)
//
//  Created by Maximilian on 16.01.2023.
//

import SwiftUI

@main
struct CaloriesTracker_CoreData_App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
