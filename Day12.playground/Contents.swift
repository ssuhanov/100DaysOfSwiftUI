import Cocoa

class Game {
  var score = 0 {
    didSet {
      print("Score is now \(score)")
    }
  }
}

var newGame = Game()
newGame.score += 10

class Employee {
  let hours: Int

  init(hours: Int) {
    self.hours = hours
  }

  func printSummary() {
    print("I work \(hours) hours a day.")
  }
}

class Developer: Employee {
  override func printSummary() {
    print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
  }

  func work() {
    printSummary()
    print("I'm writing code for \(hours) hours.")
  }
}

final class Manager: Employee {
  func manage() {
    printSummary()
    print("I'm going to meetings and managing people for \(hours) hours.")
  }
}

// class SeniorManager: Manager { } // ERROR

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.manage()

let novall = Developer(hours: 8)
novall.printSummary()

class Vehicle {
  let isElectric: Bool

  init(isElectric: Bool) {
    self.isElectric = isElectric
  }
}

class Car: Vehicle {
  let isConvertible: Bool

  init(isElectric: Bool, isConvertible: Bool) {
    // super.init(isElectric: isElectric) // ERROR
    self.isConvertible = isConvertible
    // self.isElectric = false // ERROR
    super.init(isElectric: isElectric)
  }
}

let car1 = Car(isElectric: false, isConvertible: true)
print(car1.isElectric)
print(car1.isConvertible)

class User {
  var username = "Anonymous"

  func copy() -> User {
    let user = User()
    user.username = username
    return user
  }
}

var user1 = User()
print(user1.username)
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)

struct Class {
  var user: User
  var seats: Int
}

let _ = {
  var class1 = Class(user: User(), seats: 5)
  var class2 = class1
  print(class1.seats)
  print(class2.seats)
  print(class1.user.username)
  print(class2.user.username)
  class2.user.username = "Swift"
  class2.seats = 10
  print(class1.seats)
  print(class2.seats)
  print(class1.user.username)
  print(class2.user.username)
}()

class User2 {
  let id: Int

  init(id: Int) {
    self.id = id
    print("User \(id): I'm alive!")
  }

  deinit {
    print("User \(id): I'm dead!")
  }
}

let user = User2(id: 12)

var users: [User2] = []
for i in 1...3 {
  let user = User2(id: i)
  print("User \(user.id): I'm in control!")
  users.append(user)
}
print("Loop is finished!")
users.removeAll()
print("Array is clear!")

class User3 {
  // let name = "Paul" // cannot be changed
  var name = "Paul"
}

let user3 = User3()
print(user3.name)
user3.name = "Taylor"
print(user3.name)
// user3 = User3() // ERROR

class Animal {
  let legs: Int

  init(legs: Int) {
    self.legs = legs
  }
}

class Dog: Animal {
  init() {
    super.init(legs: 4)
  }

  func speak() {
    print("Woof! Woof!")
  }
}
class Corgi: Dog {
  override func speak() {
    print("Corgi barks!")
  }
}
class Poodle: Dog {
  override func speak() {
    print("Poodle barks!")
  }
}

class Cat: Animal {
  let isTame: Bool

  init(isTame: Bool) {
    self.isTame = isTame
    super.init(legs: 4)
  }

  func speak() {
    print("Meow!")
  }
}
class Persian: Cat {
  override func speak() {
    print("Persian meowing...")
    super.speak()
  }
}
class Lion: Cat {
  override func speak() {
    print("ROAARRRR!")
  }
}

let dog1 = Dog()
dog1.speak()
let dog2 = Corgi()
dog2.speak()
let dog3 = Poodle()
dog3.speak()
let cat1 = Cat(isTame: true)
cat1.speak()
let cat2 = Persian(isTame: true)
cat2.speak()
let cat3 = Lion(isTame: false)
cat3.speak()
