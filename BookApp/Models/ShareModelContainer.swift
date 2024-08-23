//
//  ShareModelContainer.swift
//  BookApp
//
//  Created by Yazdan Vakili on 22/08/2024.
//

import Foundation
import Combine
import SwiftData

class ShareModelContainer: ObservableObject {
    @Published var modelContainer: ModelContainer

    init() {
        self.modelContainer = {
            let schema = Schema([
                Book.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
    }
}

