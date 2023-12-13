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
        HStack(spacing: 40) {
            if let weatherData = viewModel.weatherData {
                let celsiusTemperature = weatherData.main.temp - 273.15
                Text(NetworkManager.shared.cityName)
                    .font(.body)
                    .bold()
                Spacer()
                Image(systemName: "circle.fill")
                    .foregroundColor(.orange)
                Text(" \(String(format: "%.2f", celsiusTemperature))°C")
                    .font(.body)
                    .bold()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 30)
        .padding()
        .background(Color.gray)
        .cornerRadius(8)
    }
    
}

#Preview {
    WeatherView()
}