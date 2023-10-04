//
//  SplashScreen2.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 04/10/2023.
//

import SwiftUI

struct SplashScreen2: View {
    var body: some View {
        VStack{
//            Circle()
//                .fill(.white)
//                .frame(width: 100, height: 100)
//                .background(Image("AppLogo").resizable()
//                )
            Image("AppLogo")
               .resizable()
//                .scaledToFit()
                .frame(width : 100 , height : 100)
            
            Text("Select the prefered Language ")
                .padding()
            HStack{
                Circle()
                    .fill(.blue)
                    .frame(width:30,height: 30)
                Text("English")
                    .padding(10)
                
                
            }
            HStack{
                Circle()
                    .fill(.green)
//                    .border(Color.red)
//                    .stroke(Color.red)
                    .frame(alignment:.leading)
                
                
                    .frame(width:30,height: 30)
                Text("French")
                    .padding(10)
                
                
            }
            Button{
                print("Button Pressed")
            } label : {
                Text("Continue")
                    .padding(10)
                    .frame(width: 150,height:50)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(15)
//                    .margin(top: 8, left: 8)
            }
            
               
            
        }
    }
}

struct SplashScreen2_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen2()
    }
}


//Button {
//    print("Button pressed")
//} label: {
//    Text("Press Me")
//        .padding(20)
//}
