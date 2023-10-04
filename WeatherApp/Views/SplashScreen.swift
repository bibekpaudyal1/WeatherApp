//
//  SplashScreen.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 04/10/2023.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
//            Rectangle()
//                .background(Color.blue)
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width : 100 , height : 100)
            
            Text("Welcome !")
//                .font(.headline)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color.blue)
//                .fontDesign(.serif)
            Text("Alpha Health Tracker")
                .font(.headline)
                .padding()
                .foregroundColor(Color.blue)
                
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("AppColor"))
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

