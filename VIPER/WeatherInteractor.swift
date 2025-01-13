class WeatherInteractor {
    private var currentStrategy: TemperatureStrategy
    
    // Simulating fetched data
    private let currentTemperatureCelsius: Double = 25.0
    
    init(strategy: TemperatureStrategy) {
        self.currentStrategy = strategy
    }
    
    func getFormattedTemperature() -> String {
        return currentStrategy.convertTemperature(celsius: currentTemperatureCelsius)
    }
    
    func switchStrategy() -> TemperatureStrategy {
        // Switch between Celsius and Fahrenheit using a switch statement
        switch currentStrategy {
        case is CelsiusStrategy:
            currentStrategy = FahrenheitStrategy()
        case is FahrenheitStrategy:
            currentStrategy = CelsiusStrategy()
        default:
            break // Handle other cases if needed
        }
        return currentStrategy
    }
}
