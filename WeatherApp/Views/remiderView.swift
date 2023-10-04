//
//  appData.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 10/10/2023.
//
import SwiftUI

struct reminderView: View {
    @EnvironmentObject var appData: AppData
    @State private var userConsumed: [Date: Int] = [:]
    @State private var completedDrinks = []

    var body: some View {
        List {
            Text("Reminnder for \(Date())")
            ForEach(appData.alerts, id: \.self) { alert in
                VStack(alignment: .leading) {
                    Text("Date: \(alert.selectedDate, formatter: dateFormatter)")
                    Text("Drink: \(alert.drinks.name)")
                    Text("Daily Target: \(alert.dailyTarget)ml")
                    Spacer()
                    
                    ForEach(alert.reminder, id: \.self) { reminderTime in
                        reminderDetailView(
                            reminderTime: reminderTime,
                            formattedTime: timeToString(reminderTime),
                            alert: alert
                            
                        )
                        .padding(5)
                    }
                }
            }
        }
    }
    

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    struct reminderDetailView: View {
        let reminderTime: Date
        let formattedTime: String
        let alert: alerts
        @State private var isCompleted = false
        @State private var completedDrinks = []

        var body: some View {
            VStack(alignment: .leading) {
                HStack{
                    Text("Reminder Time: \(formattedTime)")
                    Button(action: {
                        markCompleted()
                    }) {
                        Text("Complete")
                            .foregroundColor(.white)
                            .padding(40)
                            .background(isCompleted ? Color.green : Color.red)
                            .frame(width: 20, height: 20)
                            .cornerRadius(50)
                    }
                }
                Text("Drink: \(alert.drinks.name)")
                Text("Please Drink  : \(alert.dailyTarget / alert.reminder.count) ml now")

              
            }
        }
            

        func markCompleted() {
            isCompleted = true
            completedDrinks.append(alert)
        }
            
    }
        

    func timeToString(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
    
        
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            reminderView()
                .environmentObject(AppData())
        }
    }
}
