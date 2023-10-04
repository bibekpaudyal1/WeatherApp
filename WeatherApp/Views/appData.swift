//
//  appData.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 10/10/2023.
//

import Foundation

class AppData: ObservableObject {
    @Published var users: [User] = []
    @Published var alerts: [alerts] = []
    

       func addUser(user: User) {
           users.append(user)
       }

    
    func addAlert(_ alert: alerts) {
        alerts.append(alert)
    }

}
