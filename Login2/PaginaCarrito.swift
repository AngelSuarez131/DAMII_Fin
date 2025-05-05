import SwiftUI

struct PaginaCarrito: View {
    @EnvironmentObject var carrito: Carrito
    @Environment(\.presentationMode) var presentationMode

    // Calcula el total del carrito
    private func calcularTotal() -> String {
        let total = carrito.items.reduce(0) { (result, item) in
            let precio = Double(item.key.precio) ?? 0.0
            return result + (precio * Double(item.value))
        }
        return String(format: "$%.2f", total)
    }

    var body: some View {
        VStack {
            Text("Carrito de Compras")
                .font(.largeTitle)
                .bold()
                .padding()

            if carrito.items.isEmpty {
                Spacer()
                Text("Tu carrito está vacío.")
                    .foregroundColor(.gray)
                    .font(.title3)
                Spacer()
            } else {
                List {
                    ForEach(Array(carrito.items.keys), id: \.self) { producto in
                        HStack {
                            Image(producto.imagen)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)

                            VStack(alignment: .leading) {
                                Text(producto.nombre)
                                    .font(.headline)
                                Text(producto.precio)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            HStack {
                                Button(action: { carrito.quitar(producto) }) {
                                    Image(systemName: "minus.circle.fill")
                                }

                                Text("\(carrito.cantidadDe(producto))")
                                    .frame(minWidth: 30)

                                Button(action: { carrito.agregar(producto) }) {
                                    Image(systemName: "plus.circle.fill")
                                }
                            }

                            Button(action: {
                                carrito.items.removeValue(forKey: producto)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .padding(.leading, 8)
                        }
                        .padding(.vertical, 4)
                    }
                }

                // Mostrar el total al final de la lista
                VStack {
                    HStack {
                        Text("Total:")
                            .font(.title)
                            .bold()
                        Spacer()
                        Text(calcularTotal())
                            .font(.title)
                            .bold()
                    }
                    .padding()
                }
            }

            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Volver a Productos")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }

                NavigationLink(destination: PaginaPago()) {
                    Text("Siguiente")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PaginaCarrito_Previews: PreviewProvider {
    static var previews: some View {
        PaginaCarrito()
            .environmentObject(Carrito())
    }
}
