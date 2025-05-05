import SwiftUI

struct Producto: Identifiable, Equatable, Hashable {
    let id = UUID()
    let nombre: String
    let imagen: String
    let precio: String
    let categoria: String
}

class Carrito: ObservableObject {
    @Published var items: [Producto: Int] = [:]

    func agregar(_ producto: Producto) {
        items[producto, default: 0] += 1
    }

    func quitar(_ producto: Producto) {
        if let cantidad = items[producto], cantidad > 1 {
            items[producto] = cantidad - 1
        } else {
            items.removeValue(forKey: producto)
        }
    }

    func cantidadDe(_ producto: Producto) -> Int {
        items[producto] ?? 0
    }

    func vaciar() {
        items.removeAll()
    }
    func precioTotal() -> String {
        let total = items.reduce(0.0) { resultado, par in
            let precioNumerico = Double(par.key.precio.replacingOccurrences(of: "S/ ", with: "")) ?? 0.0
            return resultado + (precioNumerico * Double(par.value))
        }
        return String(format: "S/ %.2f", total)
    }
}

struct PaginaProductos: View {
    @StateObject var carrito = Carrito()

    let productos: [Producto] = [
        // Entradas
        Producto(nombre: "Ceviche", imagen: "ceviche", precio: "S/ 25.00", categoria: "Entradas"),
        Producto(nombre: "Papa a la Huancaína", imagen: "papa_huancaina", precio: "S/ 12.00", categoria: "Entradas"),
        Producto(nombre: "Ocopa", imagen: "ocopa", precio: "S/ 14.00", categoria: "Entradas"),
        Producto(nombre: "Ensalada", imagen: "ensalada", precio: "S/ 10.00", categoria: "Entradas"),
        Producto(nombre: "Anticuchos", imagen: "anticuchos", precio: "S/ 18.00", categoria: "Entradas"),

        // Fondos
        Producto(nombre: "Lomo Saltado", imagen: "lomo_saltado", precio: "S/ 28.00", categoria: "Fondos"),
        Producto(nombre: "Ají de Gallina", imagen: "aji_gallina", precio: "S/ 24.00", categoria: "Fondos"),
        Producto(nombre: "Pollo a la Brasa", imagen: "pollo_brasa", precio: "S/ 30.00", categoria: "Fondos"),
        Producto(nombre: "Tacu Tacu", imagen: "tacu_tacu", precio: "S/ 26.00", categoria: "Fondos"),
        Producto(nombre: "Seco de Res", imagen: "seco_res", precio: "S/ 27.00", categoria: "Fondos"),

        // Bebidas
        Producto(nombre: "Chicha Morada", imagen: "chicha", precio: "S/ 6.00", categoria: "Bebidas"),
        Producto(nombre: "Inca Kola", imagen: "inca_kola", precio: "S/ 5.00", categoria: "Bebidas"),
        Producto(nombre: "Agua", imagen: "agua", precio: "S/ 3.00", categoria: "Bebidas"),
        Producto(nombre: "Jugo Natural", imagen: "jugo", precio: "S/ 7.00", categoria: "Bebidas"),
        Producto(nombre: "Cerveza", imagen: "cerveza", precio: "S/ 10.00", categoria: "Bebidas"),

        // Postres
        Producto(nombre: "Mazamorra Morada", imagen: "mazamorra", precio: "S/ 8.00", categoria: "Postres"),
        Producto(nombre: "Arroz con Leche", imagen: "arroz_leche", precio: "S/ 7.00", categoria: "Postres"),
        Producto(nombre: "Crema Volteada", imagen: "volteado", precio: "S/ 9.00", categoria: "Postres"),
        Producto(nombre: "Helado", imagen: "helado", precio: "S/ 6.00", categoria: "Postres"),
        Producto(nombre: "Suspiro Limeño", imagen: "suspiro", precio: "S/ 10.00", categoria: "Postres")
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // NAVBAR
                HStack {
                    Text("Restaurante")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)

                    Spacer()

                    NavigationLink(destination: MenuPrincipal()) {
                        Text("Menú")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: PaginaProductos()) {
                        Text("Productos")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: PaginaReservas()) {
                        Text("Reservas")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "door.right.hand.open")
                            .foregroundColor(.white)
                            .imageScale(.medium)
                    }
                }
                .padding()
                .padding(.top, 50)
                .background(Color.orange)
                .zIndex(1)

                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(["Entradas", "Fondos", "Bebidas", "Postres"], id: \.self) { categoria in
                            let items = productos.filter { $0.categoria == categoria }

                            VStack(alignment: .leading, spacing: 10) {
                                Text(categoria)
                                    .font(.title2)
                                    .bold()
                                    .padding(.horizontal)

                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(items) { producto in
                                            VStack(alignment: .leading, spacing: 5) {
                                                Image(producto.imagen)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 150, height: 100)
                                                    .clipped()
                                                    .cornerRadius(10)

                                                Text(producto.nombre)
                                                    .font(.headline)

                                                Text(producto.precio)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)

                                                HStack {
                                                    Button(action: { carrito.quitar(producto) }) {
                                                        Image(systemName: "minus.circle")
                                                    }
                                                    Text("\(carrito.cantidadDe(producto))")
                                                        .frame(minWidth: 20)
                                                    Button(action: { carrito.agregar(producto) }) {
                                                        Image(systemName: "plus.circle")
                                                    }
                                                }
                                                .font(.caption)
                                                .foregroundColor(.green)
                                            }
                                            .frame(width: 150)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
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
            .environmentObject(carrito)
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
            .overlay(
                HStack {
                    Spacer()
                    NavigationLink(destination: PaginaCarrito()) {
                        Image(systemName: "cart.fill")
                            .font(.title)
                            .padding()
                            .background(Color.orange)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            .padding()
                    }
                },
                alignment: .bottomTrailing
            )
        }
    }
}


struct PaginaProductos_Previews: PreviewProvider {
    static var previews: some View {
        PaginaProductos()
    }
}
