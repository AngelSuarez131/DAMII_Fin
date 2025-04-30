//
//  ContentView.swift
//  Login2
//
//  Created by Suite on 28/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username=""
    @State private var password = ""
    @State private var wrngUsername=0
    @State private var wrngPassword=0
    @State private var isActive = false
    
    
    var body: some View {
        ZStack{
            Color.red
            Circle()
                .scale(1.9)
                .foregroundColor(.white.opacity(0.3))
                
            Circle()
                .scale(1.3)
                .foregroundColor(.white.opacity(0.8))
            VStack{
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Username",text: $username)
                    .padding()
                    .frame(width: 250,height: 50)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(6)
                    .border(.red,width:CGFloat(wrngUsername))
                TextField("Password",text: $password)
                    .padding()
                    .frame(width: 250,height: 50)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(6)
                    .border(.red,width: CGFloat(wrngPassword))
                NavigationLink(isActive:$isActive){
                    MenuPrincipal()
                }label: {
                    Button( "Iniciar" )
                        {
                        isActive=true
                    }
                        .foregroundColor(.black)
                        .buttonStyle(.borderedProminent)
                    
                }
            }
                
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
