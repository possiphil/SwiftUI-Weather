//
//  EuropeView.swift
//  SwiftUI-Weather
//
//  Created by Philipp Sanktjohanser on 06.12.22.
//

import SwiftUI

struct EuropeView: View {
    @State private var isNight = false
    private var weatherOfDays: [WeatherDayView] = [
        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 62),
        WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 76),
        WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 43),
        WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 48),
        WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 13)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Berlin, DE")
                
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


struct EuropeView_Previews: PreviewProvider {
    static var previews: some View {
        EuropeView()
    }
}
