//
//  MVVMCoreDataApp.swift
//  MVVMCoreData
//
//  Created by Divya on 25/02/24.
//

import SwiftUI

@main
struct MVVMCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
