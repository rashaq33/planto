import Foundation

struct Plant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var room: String
    var light: String
    var waterDays: String
    var waterAmount: String
    var isChecked: Bool = false // ✅ متغير لحالة التشيك ليست
}
