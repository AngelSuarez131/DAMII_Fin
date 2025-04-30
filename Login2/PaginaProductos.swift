//
//  PaginaProductos.swift
//  Login2
//
//  Created by Suite on 28/04/25.
//

import SwiftUI

struct PaginaProductos: View {
    var platos = ["Ceviche", "Lomo Saltado", "Ají de Gallina", "Pollo a la Brasa"]

    var body: some View {
        NavigationView {
            VStack {
                
                HStack {//Navbar
                    Text("Restaurante ")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(1)
                    
                    Spacer()
                    NavigationLink(destination: MenuPrincipal()) {
                        Text("Menu")
                            .foregroundColor(.white)
                            .padding(.horizontal, 3)
                    }
                    
                    NavigationLink(destination: PaginaProductos()) {
                        Text("Productos")
                            .foregroundColor(.white)
                            .padding(.horizontal, 3)
                    }
                    
                    NavigationLink(destination: PaginaReservas()) {
                        Text("Reservas")
                            .foregroundColor(.white)
                            .padding(.horizontal, 7)
                    }
                    NavigationLink(destination: PaginaReservas()) {
                        Image(systemName: "door.right.hand.open")
                                .foregroundColor(.white)
                                .imageScale(.large)
                                .padding(.horizontal, 2)
                    }
                    
                }
                .padding()
                .background(Color.orange)
                //Fin delnav bar
                Text("Platos Disponibles")
                    .font(.title)
                    .padding(1)
                
                List(platos, id: \.self) { plato in
                    Text(plato)
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
        }
        
    }
}

struct PaginaProductos_Previews: PreviewProvider {
    static var previews: some View {
        PaginaProductos()
    }
}
