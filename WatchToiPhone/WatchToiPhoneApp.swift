//
//  WatchToiPhoneApp.swift
//  WatchToiPhone
//
//  Created by Kaique Diniz on 27/11/24.
//

import SwiftUI

@main
struct WatchToiPhoneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Person.self])
    }
}
