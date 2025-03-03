
import Foundation
class PlantViewModel: ObservableObject {
    @Published var plants: [Plant] = []
    // عداد يحسب عدد المهام التي تمت إضافتها (لا يُعاد تعيينه عند حذف النباتات)
    var totalTasksCount: Int = 0

    func addPlant(_ plant: Plant) {
        plants.append(plant)
        totalTasksCount += 1
        savePlants()
    }
    
    func removePlant(_ plant: Plant) {
        plants.removeAll { $0.id == plant.id }
        savePlants()
    }
    
    func deletePlant(at index: Int) {
        plants.remove(at: index)
        savePlants()
    }
    
    func toggleCheck(for index: Int) {
        // عند الضغط على دائرة التشيك ليست، تُزال النبتة من القائمة (أي المهمة أنجزت)
        removePlant(plants[index])
    }
    
    private func savePlants() {
        if let encoded = try? JSONEncoder().encode(plants) {
            UserDefaults.standard.set(encoded, forKey: "plants")
        }
    }
    
    func loadPlants() {
        if let savedData = UserDefaults.standard.data(forKey: "plants"),
           let decodedPlants = try? JSONDecoder().decode([Plant].self, from: savedData) {
            plants = decodedPlants
        }
    }
}


