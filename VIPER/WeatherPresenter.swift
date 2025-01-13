import Combine

class WeatherPresenter: ObservableObject {
    private var interactor: WeatherInteractor
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var displayedTemperature: String = ""
    
    init(interactor: WeatherInteractor) {
        self.interactor = interactor
        self.displayedTemperature = interactor.getFormattedTemperature()
    }
    
    func switchTemperatureStrategy() {
        let newStrategy = interactor.switchStrategy()
        self.displayedTemperature = interactor.getFormattedTemperature()
    }
}
