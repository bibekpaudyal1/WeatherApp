//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 04/10/2023.
//

import SwiftUI

@main
struct WeatherAppApp: App {
@StateObject private var appData = AppData()
    var body: some Scene {
       
        WindowGroup {
            ContentView()
                .environmentObject(appData)
        }
    }
}
