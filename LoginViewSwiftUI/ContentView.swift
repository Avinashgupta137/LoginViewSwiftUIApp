//
//  ContentView.swift
//  LoginViewSwiftUI
//
//  Created by Sanskar IOS Dev on 11/02/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var userName = ""
    @State private var passWord = ""
    @State private var worngUserName = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    //.scale(1.7)
                    .scale(isPad ? 1.5 : 1.7)
                    .foregroundColor(.white.opacity(0.2))
                Circle()
                    //.scale(1.36)
                    .scale(isPad ? 1.2 : 1.36)
                    .foregroundColor(.white)
                    .overlay(
                        MotionAnimationView()
                            .clipShape(Circle().scale(isPad ? 4 : 2))
                    )
                VStack(alignment: .center) {
                    Text("Login Inventory")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Enter Username",text: $userName)
                        .padding()
                        .frame(height: 50)
                        .background(Color.black.opacity(0.09))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(worngUserName))
                    
                    SecureField("Enter Password",text: $passWord)
                        .padding()
                        .frame(height: 50)
                        .background(Color.black.opacity(0.09))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button(action: {
                        autheticateUser(username : userName, password : passWord)
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                  
                }.padding()
            }.navigationBarHidden(true)
        }
    }
    func autheticateUser(username : String , password : String){
        if username.lowercased() == "avinash123"{
            worngUserName = 0
            if password.lowercased() == "12345" {
                wrongPassword = 0
                showingLoginScreen = true
            }else {
                wrongPassword = 2
            }
        }else {
            worngUserName = 2
        }
        
    }

    
}

#Preview {
    LoginView()
}
extension Color {
    static let brightOrange = Color(red: 255.0/255.0, green: 127.0/255.0, blue: 0.0/255.0)
}
