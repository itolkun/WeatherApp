//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Айтолкун Анарбекова on 13.12.2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var weatherData: WeatherData?
    
    init() {
        showWeather()
    }
    
    private func showWeather() {
        Task {
            do {
                weatherData = try await NetworkManager.shared.fetchData()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}
