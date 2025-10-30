import Cocoa

var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

var favoriteShow = "Orange is the New Black"
favoriteShow = "The Good Place"
favoriteShow = "Doctor Who"

let actor = "Denzel Washington"
print(actor.count)

let nameLength = actor.count
print(nameLength)

let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

print(filename.hasSuffix(".jpg"))
print(filename.hasSuffix(".JPG"))
print(result.uppercased())
print(quote)

let movie = """
A day in
the life of an
Apple engineer
"""
print(movie)
print(movie.hasPrefix("A day"))

let movie2 = "A day in\nthe life of an\nApple engineer"
print(movie2)

let score = 10
let reallyBig = 100_000_000
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
print(counter)

counter = counter + 5
print(counter)

counter += 7
print(counter)

counter *= 2
print(counter)

counter -= 10
print(counter)

counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))
print(number.isMultiple(of: 7))
print(120.isMultiple(of: 5))

let floatNumber = 0.1 + 0.2
print(floatNumber)

let a = 1
let b = 2.0
// let c = a + b // ERROR
let c1 = a + Int(b)
let c2 = Double(a) + b
print(c1)
print(c2)

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var actorName = "Nicolas Cage"
actorName = "John Travolta"

var actorName2 = "Nicolas Cage"
// actorName2 = 57 // ERROR

var rating = 5.0
print(rating)

rating *= 2
print(rating)

var meaningOfLife2 = 42
// meaningOfLife2 = "Forty two" // ERROR
