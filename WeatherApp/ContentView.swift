//
//  ContentView.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 04/10/2023.
//

import SwiftUI

struct ContentView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var appData: AppData
    
  @EnvironmentObject var appData: AppData
    var body: some View {
        TabView{
            homeScreen()
                .tabItem(){
                    Image(systemName:"phone.fill")
                    Text("Profile")
                }
            
             reminderView()
                .tabItem(){
                    Image(systemName: "phone.fill")
                    Text("Alerts")
                }
            addAlerts()
                .tabItem(){
                    Image(systemName: "phone.fill")
                    Text("Add Alerts")
                }
            AccountPage()
                .tabItem(){
                    Image(systemName:"phone.fill")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
       
        ContentView()
            .environmentObject(AppData())
        }
    }
}
