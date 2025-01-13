import SwiftUI
import Combine

struct WeatherView: View {
    @ObservedObject var presenter: WeatherPresenter
    
    var body: some View {
        VStack {
            Text(presenter.displayedTemperature)
                .font(.largeTitle)
            Button(action: {
                presenter.switchTemperatureStrategy()
            }) {
                Text("Toggle Celsius/Fahrenheit")
            }
        }
    }
}
