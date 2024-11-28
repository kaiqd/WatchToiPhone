//
//  ContentView.swift
//  WatchToiPhone
//
//  Created by Kaique Diniz on 27/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var people: [Person]
    
    var body: some View {
        NavigationView {
            if people.isEmpty {
                Text("Nenhuma pessoa encontrada.")
            } else {
                List(people) { person in
                    VStack(alignment: .leading) {
                        Text(person.name)
                            .font(.headline)
                        Text("Idade: \(person.age)")
                            .font(.subheadline)
                    }
                }
                .navigationTitle("Pessoas Criadas")
            }
        }
        .modelContainer(for: [Person.self])
    }
}
