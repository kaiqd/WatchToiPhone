//
//  Person.swift
//  WatchToiPhone
//
//  Created by Kaique Diniz on 27/11/24.
//


import SwiftData

@Model
public final class Person {
    @Attribute var name: String
    @Attribute var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
