//
//  addAlerts.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 09/10/2023.
//

import SwiftUI

struct Drinks: Identifiable,Hashable {
    let id = UUID()
    let name : String
    let imageName :String
    
}

struct alerts: Hashable{
    let drinks : Drinks
    let dailyTarget : Int
    let reminder : [Date]
    let selectedDate : Date
    
}

struct addAlerts: View {
    @EnvironmentObject var appData: AppData
    @State var selectDate = Date()
    @State var automatic = false
    @State var timeReminder = Date()
    @State var selectedTimes:[Date] = []
    @State var selectedAlert:[alerts]=[]
    @State var selectedDrink:Drinks?=nil
    @State var dailyTarget = ""
    let drink:[Drinks]=[
        Drinks(name:"Milk",imageName:"AppLogo"),
        Drinks(name:"Juice",imageName: "AppLogo"),
        Drinks(name:"protein",imageName: "AppLogo"),
        Drinks(name:"Coffee",imageName: "AppLogo")
        
    ]
    var body: some View {
        VStack{
        Form{
            DatePicker("Select Date",selection:$selectDate,displayedComponents:.date)
            Text("Choose the drinks")
            LazyVGrid(columns:[GridItem(.flexible()),GridItem(.flexible())],spacing:8){
                ForEach(drink){drink in
                    Button(action:{
                        selectedDrink = drink
                    }){
                        VStack{
                            Image(drink.imageName)
                                .resizable()
                                .frame(width:30,height: 30)
                            Text(drink.name)
                        }
                    }
                    .padding()
                    .cornerRadius(10)
                }
                
            }

            Toggle("Set Manual Reminder",isOn: $automatic)
            
            if automatic{
                TextField("Enter your daily target in ml",text:$dailyTarget)
                    .keyboardType(.numberPad)
                Text("Select Times For reminder")
                HStack{
                    DatePicker("Select a date",selection: $timeReminder,displayedComponents: .hourAndMinute)
                    Button("Add Time",action:{
                        selectedTimes.append(timeReminder)
                        timeReminder = Date()
                        
                    })
                }
                List{
                    ForEach(selectedTimes,id: \.self){time in
                        HStack{
                            Text(timeToString(time))
                            
                            
                        Spacer()
                            Button(action:{
                                selectedTimes.removeAll(where: { $0 == time })
                            }){
                                
                                Image(systemName: "trash")
                
                        }
                        
                    }
                }
                
                }
                
                
        }
            Button("save",action: saveReminder)
       
        
    }
            
        
    }
        .navigationTitle("set Alerts")
    }
        
        
    func saveReminder(){
        guard let selectedDrinks = selectedDrink,
              let dailyTargetInt = Int(dailyTarget),
              dailyTargetInt > 0 else{
             
              return
            
        }
        let alert = alerts(
        drinks:selectedDrinks,
        dailyTarget:dailyTargetInt,
        reminder:selectedTimes,
        selectedDate:selectDate
        )
        appData.addAlert(alert)
//        selectedAlert.append(alert)
        selectedDrink = nil
        dailyTarget = ""
        selectedTimes = []
        print("saved all the alerts")
        
        
    
        
        
        
    }
    func timeToString(_ time: Date) -> String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: time)
        }
}

struct addAlerts_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        addAlerts()
                .environmentObject(AppData())
        }
    }
}
