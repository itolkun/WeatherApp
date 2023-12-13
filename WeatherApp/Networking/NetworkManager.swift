//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Айтолкун Анарбекова on 13.12.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let cityName = "Saint Petersburg"
    let apiKey = "06e589ac44d15b423d8d1cf8c6e99825"
    
    
    func fetchData() async throws -> WeatherData {
        let url = "https://api.openweathermap.org/data/2.5/weather?q="
        let endPoint = url + cityName + "&appid=" + apiKey
        guard let url = URL(string: endPoint) else {
            throw NetworkError.invalidUrl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let weatherData: WeatherData
        
        do {
            weatherData =  try decoder.decode(WeatherData.self, from: data)
        } catch let error {
            print(error.localizedDescription)
            throw NetworkError.decodingError
        }
        return weatherData
    }
}


enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}
