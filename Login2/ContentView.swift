import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrngUsername = 0
    @State private var wrngPassword = 0
    @State private var isActive = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Restaurante")
                                            .font(.largeTitle)
                                            .bold()
                                            .foregroundColor(.white)
                                            .padding(.top, 50) // Adjust padding as needed

                                       
                    
                    Text("Login")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 100)

                    // Username TextField
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .border(Color.red.opacity(wrngUsername == 2 ? 1 : 0), width: 2)

                    // Password SecureField
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .border(Color.red.opacity(wrngPassword == 2 ? 1 : 0), width: 2)

                    NavigationLink(destination: MenuPrincipal(), isActive: $isActive) {
                        EmptyView()
                    }

                    // Login Button
                    Button(action: {
                        if username.lowercased() == "usuario" && password == "1234" {
                            wrngUsername = 0
                            wrngPassword = 0
                            errorMessage = ""
                            isActive = true
                        } else {
                            if username.lowercased() != "usuario" {
                                wrngUsername = 2
                            } else {
                                wrngUsername = 0
                            }

                            if password != "1234" {
                                wrngPassword = 2
                            } else {
                                wrngPassword = 0
                            }

                            errorMessage = "Usuario o contraseña incorrectos"
                        }
                    }) {
                        Text("Iniciar")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }

                    // Error Message
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .bold()
                            .padding(.top, 10)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
