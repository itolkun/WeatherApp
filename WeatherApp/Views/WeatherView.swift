//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Айтолкун Анарбекова on 13.12.2023.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.cities.indices, id: \.self) { index in
                weatherRow(for: index)
            }
        }
        .padding()
    }

    private func weatherRow(for index: Int) -> some View {
        HStack {
            if let weatherData = viewModel.weatherDataArray[safe: index] {
                let celsiusTemperature = (weatherData.main.temp - 273.15).rounded()
                let formattedTemperature = String(format: "%g", celsiusTemperature)
                let weatherCondition = weatherData.weather.first?.main ?? ""
                Text(viewModel.cities[index])
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .foregroundColor(.black)
                    .bold()
                HStack(spacing: 35) {
                    Image(icon(for: weatherCondition))
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Text(" \(formattedTemperature) °C")
                        .frame(width: 60)
                        .font(.body)
                        .foregroundColor(.black)
                        .bold()
                }
               
            } else {
                Text("Loading...")
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 30)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
    
    private func icon(for weatherCondition: String) -> String {
        switch weatherCondition {
        case "Clear":
            return "sun"
        case "Clouds":
            return "clouds"
        case "Rain":
            return "rain"
        case "Snow":
            return "sun"
        case "Thunderstorm":
            return "clouds"
        case "Drizzle":
            return "drizzle"
        case "Mist":
            return "foggy"
        case "Fog":
            return "foggy"
        case "Smoke":
            return "foggy"
        default:
            return "weatherapp"
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

#Preview {
    WeatherView()
}


