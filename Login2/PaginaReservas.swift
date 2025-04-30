//
//  PaginaReservas.swift
//  Login2
//
//  Created by Suite on 28/04/25.
//

import SwiftUI

struct Reserva: Identifiable {
    let id = UUID()
    let nombre: String
    let fecha: String
}

struct PaginaReservas: View {
    var reservas = [
        Reserva(nombre: "Juan Pérez", fecha: "2025-04-28"),
        Reserva(nombre: "María López", fecha: "2025-04-30")
    ]
    
    var body: some View {
        VStack {
            Text("Reservas")
                .font(.title)
                .padding()
            
            List(reservas) { reserva in
                VStack(alignment: .leading) {
                    Text(reserva.nombre)
                        .font(.headline)
                    Text(reserva.fecha)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct PaginaReservas_Previews: PreviewProvider {
    static var previews: some View {
        PaginaReservas()
    }
}

