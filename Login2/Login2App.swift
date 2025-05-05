import SwiftUI
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Db")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as! NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
@main
struct Login2App: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var carrito = Carrito() // Instancia del carrito
    @StateObject private var reservaManager = ReservaManager()
    
    var body: some Scene {
        WindowGroup {
            // Usamos PaginaCarrito como la vista inicial
            ContentView()
                .environmentObject(carrito)
                .environmentObject(reservaManager)// Pasamos el carrito como EnvironmentObject
        }
    }
    
}
