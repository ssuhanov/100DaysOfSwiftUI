import Cocoa

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false

let isMultiple = 120.isMultiple(of: 5)

var isAuthenticaated = false
isAuthenticaated = !isAuthenticaated
print(isAuthenticaated)
isAuthenticaated = !isAuthenticaated
print(isAuthenticaated)

print(gameOver)

gameOver.toggle()
print(gameOver)

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart
print(greeting)

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"
print(luggageCode)

let quote = "Then he tapped a sign saying \"Believe\" and walked away."
print(quote)

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I am \(age) years old."
print(message)

let numberEleven = 11
// let missionMessage = "Apollo " + numberEleven + " landed on the moon." // ERROR
let missionMessage = "Apollo " + String(numberEleven) + " landed on the moon."
print(missionMessage)

let missionMessage2 = "Apollo \(numberEleven) landed on the moon."
print(missionMessage2)

print("5 x 5 is \(5 * 5)")

var city = "Cardiff"
var message2 = "Welcome to \(city)!"
print(message2)

let celsius = 25.0
let fahrenheit = celsius * 9.0 / 5.0 + 32.0
print("\(celsius)°C is equal to \(fahrenheit)°F")
