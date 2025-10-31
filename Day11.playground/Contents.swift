import Cocoa

struct BankAccount {
  private(set) var funds = 0

  mutating func deposit(amount: Int) {
    funds += amount
  }

  mutating func withdraw(amount: Int) -> Bool {
    if funds >= amount {
      funds -= amount
      return true
    } else {
      return false
    }
  }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
  print("Withdrew money successfully")
} else {
  print("Failed to get the money")
}
print("Current amount: \(account.funds)")

struct School {
  nonisolated(unsafe) static var studentCount = 0

  static func add(student: String) {
    print("\(student) joined the school.")
    studentCount += 1
  }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
  static let version = "1.3 beta 2"
  static let saveFileName = "setting.json"
  static let homeUrl = "https://www.hackingwithswift.com"
}

print(AppData.version)

struct Employee {
  let username: String
  let password: String

  static let example = Employee(username: "cfederighi", password: "hairforceone")
}
print(Employee.example)

enum Unwrap {
  static let appUrl = "https://itunes.apple.com/app/id1440611372"

  nonisolated(unsafe) private static var entropy = Int.random(in: 1...1000)

  static func getEntropy() -> Int {
    entropy += 1
    return entropy
  }
}

struct Car {
  let model: String
  let numberOfSeats: Int
  private var currentGear: Int = 0

  init(model: String, numberOfSeats: Int) {
    self.model = model
    self.numberOfSeats = numberOfSeats
  }

  mutating func gearUp() {
    if currentGear >= 6 {
      print("We're already on the max gear")
    } else {
      currentGear += 1
      if currentGear == 0 {
        print("Switching to Parking")
      } else {
        print("We're driving on gear \(currentGear)")
      }
    }
  }

  mutating func gearDown() {
    if currentGear == 0 {
      print("Switching to reverse")
      currentGear -= 1
    } else if currentGear <= -1 {
      print("We're already in reverse")
    } else {
      currentGear -= 1
      print("We're driving on gear \(currentGear)")
    }
  }
}

var car = Car(model: "VW", numberOfSeats: 5)
car.gearDown()
car.gearDown()
car.gearUp()
car.gearUp()
car.gearUp()
car.gearUp()
car.gearUp()
car.gearUp()
car.gearUp()
car.gearUp()
