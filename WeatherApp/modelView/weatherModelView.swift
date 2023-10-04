//
//  weatherModelView.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 09/10/2023.
//

import Foundation

class WeatherViewMode : ObservableObject {
    @Published var userInfo : UserInfo = UserInfo(
        firstName:"",
        lastName: "",
        address: "",
        //        dateOfBirth: <#T##Date#>(),
        
        heightInCm: "",
        weightInKg: ""
    )
}
//    func saveUser(){
//        let firstName = userInfo.firstName
//        let lastName = userInfo.lastName
//        let address = userInfo.address
///      let dateOfBirth = userInfo.dateOfBirth
//        let heightInCm = userInfo.heightInCm
//        let weightInKg = userInfo.weightInKg
//    
//        
//        
//    
//}
