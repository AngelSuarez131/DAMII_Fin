import Foundation
import CoreData
import SwiftUI

class ReservaManager: ObservableObject {
    let context: NSManagedObjectContext

    @Published var reservas: [Reserva] = []

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
        fetchReservas()
    }

    func addReserva(nombre: String, fecha: Date, hora: Date, mesa: String, personas: Int16) {
        let newReserva = Reserva(context: context)
        newReserva.nombre = nombre
        newReserva.fecha = fecha
        newReserva.hora = hora
        newReserva.mesa = mesa
        newReserva.personas = personas

        saveContext()
        fetchReservas()
    }

    func fetchReservas() {
        let request: NSFetchRequest<Reserva> = Reserva.fetchRequest()
        do {
            reservas = try context.fetch(request)
        } catch {
            print("Error fetching reservas: \(error)")
        }
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    }
}
