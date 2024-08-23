//
//  BookAppApp.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import SwiftUI


@main
struct BookAppApp: App {
    
    @ObservedObject var sharedModelContainer = ShareModelContainer()

    var body: some Scene {
        WindowGroup {
            TabbarView()
        }
        .modelContainer(sharedModelContainer.modelContainer)
    }
}
