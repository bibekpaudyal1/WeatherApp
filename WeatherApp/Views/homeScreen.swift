//
//  homeScreen.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 04/10/2023.
//

import SwiftUI

struct homeScreen: View {
    @EnvironmentObject var appData: AppData
    var body: some View {
        

        VStack(alignment:.leading){
            Text("Good Morning !")
            
            if let user = appData.users.first {
                            Text("Hello, \(user.firstName) \(user.lastName)")
                        } else {
                            Text(" New User")
                        }
            
            ZStack{
                Color.blue
                VStack(alignment:.leading){
                    Text(currentTime())
                    Text(currentDate())
                    Button("Add",action: moveToTop)
                    
                    
                }
                .foregroundColor(.white)
                .padding(20)
                .frame(maxWidth:.infinity,maxHeight: 150)
                .cornerRadius(10)
            }
            .frame(maxHeight:150)
            .cornerRadius(10)
            
            ZStack(alignment:.leading){
                Color.red
                Text("Today Goal")
                Text("Remaining")
            }
            .foregroundColor(.blue)
            .cornerRadius(10)
            .frame(maxHeight:150)
            
           Text("You have completed the 60% of your target. 2 notifcations are still missing")
                .padding(30)
            
            
            
        }
    }
    func moveToTop(){
        print("Testing the functions")
    }
    func currentTime() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: Date())
        }
        
    func currentDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: Date())
        }
}
    


struct homeScreen_Previews: PreviewProvider {
    static var previews: some View {
        homeScreen()
            .environmentObject(AppData())
    }
}
