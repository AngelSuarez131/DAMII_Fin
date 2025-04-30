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
        VStack {
            Text("Platos Disponibles")
                .font(.title)
                .padding()
            
            List(platos, id: \.self) { plato in
                Text(plato)
            }
        }
    }
}

struct PaginaProductos_Previews: PreviewProvider {
    static var previews: some View {
        PaginaProductos()
    }
}
