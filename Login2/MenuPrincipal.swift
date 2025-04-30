//
//  MenuPrincipal.swift
//  Login2
//
//  Created by Suite on 28/04/25.
//

import SwiftUI

struct MenuPrincipal: View {
    var platosPrincipales = ["Ceviche", "Lomo Saltado", "Ají de Gallina", "Pollo a la Brasa"]
    var imagenesCarrusel = ["comida1", "comida2", "comida3"] // Nombres de tus imágenes en Assets.xcassets

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // NAVBAR
                HStack {
                    Text("Restaurante Delicioso")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.red)
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // CARRUSEL
                        TabView {
                            ForEach(imagenesCarrusel, id: \.self) { imagen in
                                Image(imagen)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                            }
                        }
                        .frame(height: 200)
                        .tabViewStyle(PageTabViewStyle())
                        
                        // SECCIÓN PLATOS PRINCIPALES
                        VStack(alignment: .leading) {
                            Text("Platillos Principales")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(platosPrincipales, id: \.self) { plato in
                                        VStack {
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.3))
                                                .frame(width: 150, height: 100)
                                                .overlay(Text(plato).bold())
                                                .cornerRadius(10)
                                            
                                            Text(plato)
                                                .font(.caption)
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        Spacer()
                    }
                }
                
                // FOOTER
                VStack {
                    Divider()
                    Text("© 2025 Restaurante Delicioso")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(10)
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
        }
    }
}

struct MenuPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipal()
    }
}

