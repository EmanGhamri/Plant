import SwiftUI

@Observable
class PlantViewModel {
    
    // MARK: - Data
    var plants: [Plant] = []
    
    // MARK: - Calculated values
    var wateredCount: Int {
        plants.filter { $0.isWatered }.count
    }
    
    var progress: Double {
        plants.isEmpty ? 0 : Double(wateredCount) / Double(plants.count)
    }
    var statusMessage: String {
        if wateredCount == 0 {
            return "Your plants are waiting for a sip 💦"
        } else {
            return "\(wateredCount) of your plants feel loved today✨"
        }
    }
    
    // MARK: - Actions
    func addPlant(_ plant: Plant) {
        plants.append(plant)
        NotificationManager.shared.schedule(for: plant)
    }
    
    func toggleWatered(_ plant: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index].isWatered.toggle()
        }
    }
    func updatePlant(_ updated: Plant) {
        if let index = plants.firstIndex(where: { $0.id == updated.id }) {
            plants[index] = updated
        }
    }
    
    func deletePlant(at offsets: IndexSet) {
        plants.remove(atOffsets: offsets)
    }
    func deletePlant(_ plant: Plant) {
        plants.removeAll { $0.id == plant.id }
    }
}
