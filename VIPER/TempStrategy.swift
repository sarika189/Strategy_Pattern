//This protocol defines the interface for the strategie
protocol TemperatureStrategy {
    func convertTemperature(celsius: Double) -> String
}

class CelsiusStrategy: TemperatureStrategy {
    func convertTemperature(celsius: Double) -> String {
        return "\(celsius)°C"
    }
}

class FahrenheitStrategy: TemperatureStrategy {
    func convertTemperature(celsius: Double) -> String {
        let fahrenheit = (celsius * 9 / 5) + 32
        return "\(fahrenheit)°F"
    }
}

/*The Strategy pattern is a behavioral design pattern that allows you to define a family of algorithms,
 encapsulate each one, and make them interchangeable.
The pattern lets you choose the algorithm to be used at runtime,
 without altering the client that uses it.

In SwiftUI, we can use the Strategy pattern to change the behavior of a view depending on 
certain conditions. 
Combine can be used for managing the state changes and ensuring that views 
react to updates in a declarative way. */