//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Philipp Sanktjohanser on 23.11.22.
//

// MARK: Challenge 1 = Create a data model for WeatherDayView (with an array) { DONE }
// MARK: Challenge 2 = Create a network call from a basic weather api
// MARK: Challenge 3 = Build a TabBar that shows multiple cities

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    private var weatherOfDays: [WeatherDayView] = [
        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74),
        WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88),
        WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55),
        WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60),
        WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View, Hashable {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
