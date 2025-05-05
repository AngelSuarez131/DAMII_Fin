

/*struct Reserva: Identifiable {
    let id = UUID()
    let nombre: String
    let fecha: String
    let hora: String // New property for time
    let mesa: String // New property for table
    let personas: Int
    var productos: [Producto]// New property for number of people
}*/

import SwiftUI

struct PaginaReservas: View {
    @StateObject var reservaManager = ReservaManager()

    var body: some View {
        VStack {
            Text("Reservas")
                .font(.title)
                .padding()
            
            List(reservaManager.reservas) { reserva in
                VStack(alignment: .leading) {
                    Text(reserva.nombre ?? "Prenom")
                        .font(.headline)
                    Text("Fecha: \(formatDate(reserva.fecha ?? Date()))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Hora: \(formatTime(reserva.hora ?? Date()))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Mesa: \(reserva.mesa ?? "Sin mesa")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Personas: \(reserva.personas)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    // Display selected products
                    /*Text("Productos:")
                        .font(.subheadline)
                        .bold()
                    ForEach(reserva.productos, id: \.id) { producto in
                        Text(producto.nombre)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    } */               }
            }

            NavigationLink(destination: AgregarReserva()) {
                Text("Agregar Nueva Reserva")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .onAppear {
            reservaManager.fetchReservas() // Fetch reservations when the view appears
        }
    }
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short // Change to desired date style
        return formatter.string(from: date)
    }

    // Helper function to format the time
    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short // Change to desired time style
        return formatter.string(from: date)
    }
}

struct PaginaReservas_Previews: PreviewProvider {
    static var previews: some View {
        PaginaReservas()
    }
}
