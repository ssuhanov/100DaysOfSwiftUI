import Cocoa


func printTimeTables(for number: Int, end: Int = 12) {
  for i in 1...end {
    print("\(i) x \(number) is \(i * number)")
  }
}

printTimeTables(for: 5, end: 20)
printTimeTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
  print(#function)
}

findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)

enum PasswordError: Error {
  case short
  case obvious
}

func checkPassword(_ password: String) throws -> String {
  if password.count < 5 {
    throw PasswordError.short
  }

  if password == "12345" {
    throw PasswordError.obvious
  }

  if password.count < 8 {
    return "OK"
  } else if password.count < 10 {
    return "Good"
  } else {
    return "Excellent"
  }
}

let string = "12345"
do {
  let result = try checkPassword(string)
  print("Password rating: \(result)")
} catch PasswordError.short {
  print("Please use a longer password.")
} catch PasswordError.obvious {
  print("I have the same combination on my luggage!")
} catch {
  print("There was an error.")
}

enum MySqrtError: Error {
  case outOfBounds
  case noRoot
}

func mySqrt(from value: Int) throws -> Int {
  if value < 1 || value > 10_000 {
    throw MySqrtError.outOfBounds
  }

  for i in 1...100 {
    if i > value {
      break
    }

    if i * i == value {
      return i
    }
  }

  throw MySqrtError.noRoot
}

func printMySqrt(from value: Int) {
  do {
    print(try mySqrt(from: value))
  } catch MySqrtError.outOfBounds {
    print("Out of Bounds")
  } catch MySqrtError.noRoot {
    print("No root")
  } catch {
    print("Some other error")
  }
}

printMySqrt(from: 4)
printMySqrt(from: 2)
printMySqrt(from: -1)
printMySqrt(from: 10_001)
printMySqrt(from: 144)
printMySqrt(from: 145)
printMySqrt(from: 3)
printMySqrt(from: 10_000)
printMySqrt(from: 1)
printMySqrt(from: 9_999)
