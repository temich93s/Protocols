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


//MARK: Требование методов
print("\n//Требование методов")

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.3746499199817101"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"


//MARK: Требования изменяющих методов
print("\n//Требования изменяющих методов")

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
print(lightSwitch)
lightSwitch.toggle()
print(lightSwitch)
// lightSwitch is now equal to .on


//MARK: Реализация класса соответствующего протоколу с требованием инициализатора
print("\n//Реализация класса соответствующего протоколу с требованием инициализатора")

protocol SomeProtocol1 {
    var a: Int { get set }
    init(a: Int)
}

struct a1: SomeProtocol1 {
    var a: Int
    init(a: Int) {
        self.a = a
    }
}

var a2 = a1(a: 3)
print(a2)


//MARK: Протоколы как типы
print("\n//Протоколы как типы")

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
print()

var d7 = Dice(sides: 7, generator: generator)
for _ in 1...5 {
    print("Random dice roll is \(d7.roll())")
}
