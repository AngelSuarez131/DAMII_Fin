import SwiftUI

struct AgregarReserva: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var reservaManager: ReservaManager
    @State private var nombre: String = ""
    @State private var selectedDate = Date() // State variable for date
    @State private var selectedTime = Date() // State variable for time
    @State private var mesa: Int = 1 // Default to 1
    @State private var personas: Int = 1 // Default to 1
    @State private var selectedProductos: [Producto] = []
    @State private var allProductos: [Producto] = [
        // Sample products
        Producto(nombre: "Ceviche", imagen: "ceviche", precio: "S/ 25.00", categoria: "Entradas"),
        Producto(nombre: "Lomo Saltado", imagen: "lomo_saltado", precio: "S/ 28.00", categoria: "Fondos"),
        // Add more products as needed
    ]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Agregar Reserva")) {
                    TextField("Nombre", text: $nombre)

                    // Date Picker for selecting the date
                    DatePicker("Fecha", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle()) // You can change the style as needed

                    // Time Picker for selecting the time
                    DatePicker("Hora", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle()) // You can change the style as needed

                    // Picker for mesa selection
                    Picker("Mesa", selection: $mesa) {
                        ForEach(1...20, id: \.self) { number in
                            Text("Mesa \(number)").tag(number)
                        }
                    }
                    .pickerStyle(MenuPickerStyle()) // You can change the style as needed

                    // Picker for personas selection
                    Picker("Personas", selection: $personas) {
                        ForEach(1...8, id: \.self) { number in
                            Text("\(number) persona\(number > 1 ? "s" : "")").tag(number)
                        }
                    }
                    .pickerStyle(MenuPickerStyle()) // You can change the style as needed
                }

                /*Section(header: Text("Seleccionar Productos")) {
                    ForEach(allProductos) { producto in
                        HStack {
                            Text(producto.nombre)
                            Spacer()
                            Button(action: {
                                if !selectedProductos.contains(producto) {
                                    selectedProductos.append(producto)
                                }
                            }) {
                                Text("Agregar")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }*/

                Button("Guardar Reserva") {
                                    reservaManager.addReserva(nombre: nombre, fecha: selectedDate, hora: selectedTime, mesa: String(mesa), personas: Int16(personas))
                                    presentationMode.wrappedValue.dismiss()
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
            }
            .navigationTitle("Nueva Reserva")
        }
    }

    // Helper function to format the date
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

struct AgregarReserva_Previews: PreviewProvider {
    static var previews: some View {
        AgregarReserva()
    }
}
