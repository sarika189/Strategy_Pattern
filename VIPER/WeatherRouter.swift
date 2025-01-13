struct WeatherRouter {
    func navigateToAnotherView() {
       let interactor = WeatherInteractor(strategy: CelsiusStrategy())
            let presenter = WeatherPresenter(interactor: interactor)
            WeatherView(presenter: presenter)
    }
}
