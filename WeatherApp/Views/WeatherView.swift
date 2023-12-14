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
        HStack(spacing: 40) {
            if let weatherData = viewModel.weatherDataArray[safe: index] {
                let celsiusTemperature = weatherData.main.temp - 273.15

                Text(viewModel.cities[index])
                    .font(.body)
                    .bold()
                Spacer()
                Image(systemName: "circle.fill")
                    .foregroundColor(.orange)
                Text(" \(String(format: "%.2f", celsiusTemperature))°C")
                    .font(.body)
                    .bold()
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
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

#Preview {
    WeatherView()
}


