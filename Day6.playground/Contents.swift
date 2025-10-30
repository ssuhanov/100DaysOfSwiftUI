import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
  print("Swift works great on \(os).")
}

for name in platforms {
  print("Swift works great on \(name).")
}

for rubberDuck in platforms {
  print("Swift still works great on \(rubberDuck).")
}

for platform in platforms {
  print("And Swift also works great on \(platform).")
}

for i in 1...12 {
  print("5 x \(i) is \(5 * i)")
}

print()
for i in 1...12 {
  print("The \(i) times table:")

  for j in 1...12 {
    print("  \(j) x \(i) is \(j * i)")
  }

  print()
}

for i in 1...5 {
  print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
  print("Counting 1 up to 5: \(i)")
}

print()

var lyric = "Haters gonna"

for _ in 1...5 {
  lyric += " hate"
}

print(lyric)

let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for name in names {
  print("\(name) is a secret agent")
}

for _ in names {
  print("[CENSORED] is a secret agent!")
}

let names2 = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names2[0])
print(names2[1...2])
print(names2[1...])

var countdown = 10
while countdown > 0 {
  print("\(countdown)...")
  countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0
while roll != 20 {
  roll = Int.random(in: 1...20)
  print("I rolled a \(roll)")
}
print("Critical hit!")

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
  if filename.hasSuffix(".jpg") == false {
    continue
  }

  print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples: [Int] = []

for i in 1...100_000 {
  if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
    multiples.append(i)

    if multiples.count == 10 {
      break
    }
  }
}

print(multiples)

let scores = [1, 8, 4, 3, 0, 5, 2]
var count = 0

for score in scores {
  if score == 0 {
    break
  }

  count += 1
}

print("You had \(count) scores before you got a zero.")

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
  for option2 in options {
    for option3 in options {
      print("In loop")
      let attempt = [option1, option2, option3]

      if attempt == secretCombination {
        print("The combination is \(attempt)!")
        break outerLoop
      }
    }
  }
}

for i in 1...100 {
  if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
    print("FizzBuzz")
  } else if i.isMultiple(of: 3) {
    print("Fizz")
  } else if i.isMultiple(of: 5) {
    print("Buzz")
  } else {
    print(i)
  }
}
