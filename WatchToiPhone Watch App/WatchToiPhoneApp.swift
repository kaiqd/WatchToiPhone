//
//  WatchToiPhoneApp.swift
//  WatchToiPhone Watch App
//
//  Created by Kaique Diniz on 27/11/24.
//

import SwiftUI
import SwiftData

@main
struct WatchApp: App {
    var body: some Scene {
        WindowGroup {
            HealthKitView()
        }
        .modelContainer(for: [Person.self])
    }
}
