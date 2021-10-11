//
//  main.swift
//  Protocols
//
//  Created by 2lup on 11.10.2021.
//

import Foundation

print("Hello, World!")


//MARK: Требование свойств
print("\n//Требование свойств")

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
print(john)

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)
// ncc1701.fullName равен "USS Enterprise"


