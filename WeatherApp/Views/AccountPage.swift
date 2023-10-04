//
//  appData.swift
//  WeatherApp
//
//  Created by BIBEK PAUDYAL on 10/10/2023.
//


import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var address: String
    var dateOfBirth: Date
    var gender: String
    var heightInCm: String
    var weightInKg: String
}


struct AccountPage: View {
    @EnvironmentObject var appData: AppData

    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var address: String = ""
    @State private var heightInCm: String = ""
    @State private var weightInKg: String = ""
    @State private var dateOfBirth = Date()
    @State private var gender = "Male"
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Address", text: $address)
                
                DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                
                Picker("Gender", selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Other").tag("Other")
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Body Information")) {
                TextField("Enter your body Weight", text: $weightInKg)
                TextField("Enter your height", text: $heightInCm)
            }
            
            Section {
                Button("Save", action: saveUserData)
            }
        }
        .navigationTitle("Account Information")
    }

    func saveUserData() {
        let user = User(
                    firstName: firstName,
                    lastName: lastName,
                    address: address,
                    dateOfBirth: dateOfBirth,
                    gender: gender,
                    heightInCm: heightInCm,
                    weightInKg: weightInKg
                )
        appData.addUser(user: user)
        print("User data have been saved.")

    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountPage()
                .environmentObject(AppData())
        }
    }
}
