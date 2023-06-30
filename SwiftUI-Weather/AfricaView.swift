//
//  AfricaView.swift
//  SwiftUI-Weather
//
//  Created by Philipp Sanktjohanser on 06.12.22.
//

import SwiftUI

struct AsiaView: View {
    @State private var isNight = false
    private var weatherOfDays: [WeatherDayView] = [
        WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 86),
        WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 100),
        WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 67),
        WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 72),
        WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 60)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Bangkok, THA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    ForEach(weatherOfDays, id: \.self) {
                        WeatherDayView(dayOfWeek: $0.dayOfWeek, imageName: $0.imageName, temperature: $0.temperature)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: { WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white) }
                
                Spacer()
            }
        }
    }
}

struct AsiaView_Previews: PreviewProvider {
    static var previews: some View {
        AsiaView()
    }
}
