//
//  SwiftUI_WeatherApp.swift
//  SwiftUI-Weather
//
//  Created by Philipp Sanktjohanser on 23.11.22.
//
// https://www.youtube.com/watch?v=HXoVSbwWUIk

import SwiftUI

@main
struct SwiftUI_WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem{
                        Label("Cuppertino", systemImage: "globe.americas.fill")
                    }
                
                EuropeView()
                    .tabItem{
                        Label("Berlin", systemImage: "globe.europe.africa.fill")
                    }
                
                AsiaView()
                    .tabItem{
                        Label("Bangkok", systemImage: "globe.asia.australia.fill")
                    }
            }
        }
    }
}
