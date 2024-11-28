//
//  ContentView.swift
//  WatchToiPhone Watch App
//
//  Created by Kaique Diniz on 27/11/24.
//


import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Nome", text: $name)
                    .padding()
                TextField("Idade", text: $age)
                    .padding()
                Button("Salvar") {
                    guard let ageValue = Int(age) else {
                        print("Idade inválida")
                        return
                    }
                    let newPerson = Person(name: name, age: ageValue)
                    context.insert(newPerson)
                    
                    do {
                        try context.save()
                        print("Pessoa salva com sucesso: \(newPerson.name), \(newPerson.age)")
                    } catch {
                        print("Erro ao salvar pessoa: \(error.localizedDescription)")
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()

                // Navegação para WatchListView
                NavigationLink("Ir para lista de pessoas", destination: WatchListView())
                    .buttonStyle(.bordered)
                    .padding()
            }
        }
    }
}

struct WatchListView: View {
    @Query private var people: [Person]

    var body: some View {
        VStack {
            if people.isEmpty {
                Text("Nenhuma pessoa criada.")
                    .font(.headline)
            } else {
                List(people) { person in
                    HStack {
                        Text(person.name)
                        Spacer()
                        Text("\(person.age) anos")
                    }
                }
            }
        }
        .navigationTitle("Pessoas")
    }
}
