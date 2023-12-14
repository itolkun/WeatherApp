//
//  ContentView.swift
//  WeatherApp
//
//  Created by Айтолкун Анарбекова on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Weather Information")
                .font(.title)
                .foregroundColor(.white)
                .padding()
            
            ScrollView {
                WeatherView()
            }
        }
        .background(Color("BackColor"))
        
    }
}

#Preview {
    ContentView()
}
