//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Айтолкун Анарбекова on 13.12.2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var weatherDataArray: [WeatherData] = []
    let cities = [
        "Saint Petersburg",
        "Bishkek",
        "New York",
        "Lisbon",
        "San Francisco",
        "Almata",
        "Moscow",
        "London",
        "Sidney",
        "Paris",
        "Amsterdam",
        "Kemer"
    ]

    
    init() {
        showWeather()
    }
    
    private func showWeather() {
        Task {
            do {
                let fetchedWeatherDataArray = try await NetworkManager.shared.fetchData(for: cities)
                DispatchQueue.main.async {
                    self.weatherDataArray = fetchedWeatherDataArray
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}
