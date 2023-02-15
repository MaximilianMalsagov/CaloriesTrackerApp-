//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Максимилиан Мальсагов on 11.02.2023.
//

import SwiftUI
import Firebase


@main
struct ChatAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
