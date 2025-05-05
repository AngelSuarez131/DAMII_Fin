import SwiftUI

struct PaginaPago: View {
    @EnvironmentObject var carrito: Carrito
    @State private var nombre: String = ""
    @State private var direccion: String = ""
    @State private var telefono: String = ""
    @State private var tarjeta: String = ""
    @State private var mostrarAlerta = false
    @State private var mensajeAlerta = ""

    // Función para validar los campos
    private func camposValidos() -> Bool {
        return !nombre.isEmpty && !direccion.isEmpty && !telefono.isEmpty && !tarjeta.isEmpty
    }

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Datos Personales")) {
                        TextField("Nombre completo", text: $nombre)
                        TextField("Dirección", text: $direccion)
                        TextField("Teléfono", text: $telefono)
                            .keyboardType(.phonePad)
                    }

                    Section(header: Text("Datos de Pago")) {
                        TextField("Número de Tarjeta", text: $tarjeta)
                            .keyboardType(.numberPad)
                    }

                    Section {
                        HStack {
                            Text("Total:")
                                .font(.headline)
                            Spacer()
                            Text(carrito.precioTotal())
                                .bold()
                        }
                    }

                    Section {
                        Button("Pagar") {
                            if camposValidos() {
                                mensajeAlerta = "¡Pago exitoso!"
                                carrito.items.removeAll()
                            } else {
                                mensajeAlerta = "Por favor completa todos los campos."
                            }
                            mostrarAlerta = true
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                    }
                }

                // Alerta de pago
                .alert(isPresented: $mostrarAlerta) {
                    Alert(title: Text(mensajeAlerta), dismissButton: .default(Text("OK")))
                }
            }
            .navigationTitle("Formulario de Pago")
        }
    }
}

struct PaginaPago_Previews: PreviewProvider {
    static var previews: some View {
        PaginaPago()
            .environmentObject(Carrito())
    }
}

