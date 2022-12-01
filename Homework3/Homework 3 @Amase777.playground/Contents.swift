import UIKit
import Foundation


protocol Movable {
    func run()
    func saySomething()
}

protocol Fightable{
    func fight()
    var hp: Int { get set }
}

protocol Hero: Fightable, Movable {
    var name: String { get }
    func shoot()
}



let phrases: [String] = ["Today is nice weather", "Hi! How are you?", "Sorry, I'm busy"]
struct Farmer: Movable {
    func saySomething() {
        print(phrases.randomElement()!)
    }
    
    var amountOfAnimals: Int?
    func run() {
        print("Farmer: run")
    }
    
    func greting() -> Void{
        
        if amountOfAnimals == 1{
            print("I have only one animal in my farm")
        } else if amountOfAnimals != nil {
            print( "I have \(amountOfAnimals!) animals")
        } else if amountOfAnimals == nil {
            print("I haven't animals")
        }
    }
    
}

struct Peasant: Movable {
    func saySomething() {
        print(phrases.randomElement()!)
    }
    
    let village: String?
    let city: String?
    func run() {
        print("Peasant: run")
    }
    
    
    func peasantLocation(){
        if village != nil {
            print("Hi, I from village: \(village!)")
        } else if city != nil {
            print("Hi, I from city: \(city!)")
        } else if city != nil  && village != nil {
            print("Error: peasant can't had a 2 values")
        } else {
            print("I haven't a house")
        }
    }
}

struct Butcher: Fightable{
    var hp: Int
    
    func fight() {
        print("Butcher: fight")
    }
}

struct Bandit: Fightable{
    var hp: Int
    
    var money: Int?
    func fight() {
        print("Bandit: fight")
    }
    
    func countOfMoney() -> Int?{
        money
    }
    
    mutating func robABank(){
        if money == nil{
            money = 9999
        } else if money != nil {
            money! += 9999
        }
    }
    
}


struct Cowboy: Hero{
    func shoot() {
        print("Cowboy: shoot")
    }
    
    var hp: Int
    
    func saySomething() {
        print(phrases.randomElement()!)
    }
    
    var name: String
    
    func fight() {
        print("Cowboy: fight")
    }
    
    func run() {
        print("Cowboy: run")
    }
}



struct Sheriff: Hero {
    func shoot() {
        print("Sheriff: shoot")
    }
    
    var hp: Int
    
    func saySomething() {
        print(phrases.randomElement()!)
    }
    
    var name: String
    
    func fight() {
        print("Sheriff: fight")
    }
    
    func run() {
        print("Sheriff: run")
    }
}



class Tavern {
    var fighters: [Fightable] = []
    var movers: [Movable] = []
    func enterTavern(hero: Hero){
        hero.fight()
        for character in movers{
            character.run()
        }
        for character in fighters{
            character.fight()
        }
        
        
    }
    
}

var alice = Farmer()
var jake = Peasant(village: nil, city: "Houston")
var jordan = Butcher(hp: 70)
var crang = Bandit(hp: 140)
var john = Sheriff(hp: 120, name: "John")
var richard = Cowboy(hp: 130, name: "Richard")

var tavern = Tavern()

tavern.movers.append(alice)
tavern.movers.append(jake)
tavern.fighters.append(jordan)
tavern.fighters.append(crang)
tavern.enterTavern(hero: richard)

print(" ")
alice.greting()
alice.amountOfAnimals = 1
alice.greting()
alice.amountOfAnimals = 3
alice.greting()

jake.peasantLocation()

crang.robABank()
crang.countOfMoney()!

crang.robABank()

crang.robABank()


//3

extension Int {
    mutating func powerOf(N: Int){
        let number1 = self
        for _ in 2...N{
            self = self * number1
            print("self - \(self), number1 - \(number1), N - \(N)" )
        }
    }
}


var number = 2

number.powerOf(N: 2)
print(number)

number = 2
number.powerOf(N: 5)
print(number)

number = 5
number.powerOf(N: 2)
print(number)


extension String {
    func isPalindrome() -> Bool{
        let word = self
        
        let char = Array(self)
        for i in 0..<char.count / 2 {
            if char[i] != char[char.count - 1 - i] {
                return false
            }
        }
        return true
    }
}





let a = "ababa".isPalindrome()
let b = "ababas".isPalindrome()
let c = "gag & gag".isPalindrome()


//5

func task5<T,D>(value1: T, value2: D) -> [T: D]{
    [value1: value2]
}


func task5_1<T,D>(value1:  T, value2:  D) -> Array<Any>{
    let temporaryValue1 = value2
    let temporaryValue2 = value1
    return [temporaryValue1, temporaryValue2]
}

task5_1(value1: 555, value2: 777)


func task5_2<T,D>(value1: T, value2: D) -> Array<Any> {
    [value1, value2]
    
}

task5_2(value1: "SomeString", value2: 123)


func task5_3<T: BinaryInteger>(value1: T, value2: T) -> Int {
    Int(value1) + Int(value2)
}

task5_3(value1: 5, value2: 9)

