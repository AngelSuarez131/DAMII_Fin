import SwiftUI

struct MenuPrincipal: View {
    var platosPrincipales = ["Ceviche", "Lomo Saltado", "Ají de Gallina", "Pollo a la Brasa","Causa"]
    var imagenesCarrusel = ["comida1", "comida2", "comida3", "comida4", "comida5"]

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
                .padding(.top, 75) // separa del notch
                .background(Color.orange)
                .zIndex(1)

                ScrollView {
                    VStack(spacing: 30) {
                        // CARRUSEL
                        TabView {
                            ForEach(imagenesCarrusel, id: \.self) { imagen in
                                Image(imagen)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                        .frame(height: 220)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

                        // SECCIÓN PLATOS PRINCIPALES
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Platillos Principales")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(platosPrincipales, id: \.self) { plato in
                                        VStack {
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.2))
                                                .frame(width: 150, height: 100)
                                                .overlay(Text(plato)
                                                    .font(.headline)
                                                    .foregroundColor(.black))
                                                .cornerRadius(10)

                                            Text(plato)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }

                        // SECCIÓN QUIÉNES SOMOS
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Quiénes Somos")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)

                            Text("En Restaurante Delicioso nos apasiona ofrecer comida peruana auténtica con los mejores ingredientes. Nuestra misión es brindar una experiencia culinaria inolvidable para toda la familia.")
                                .font(.body)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }

                        Spacer(minLength: 30)
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
