import SwiftUI

struct AddPlantView: View {
    @ObservedObject var viewModel: PlantViewModel
    @Environment(\.dismiss) var dismiss

    @State private var plantName = ""
    @State private var selectedRoom = "Living Room"
    @State private var selectedLight = "Full Sun"
    @State private var selectedWaterDays = "Every day"
    @State private var selectedWaterAmount = "20-50 ml"

    let rooms = ["Living Room", "Kitchen", "Balcony", "Bathroom"]
    let lightOptions = ["Full Sun", "Partial Sun", "Low Sun"]
    let waterDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmounts = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Plant Details")) {
                    TextField("Plant Name", text: $plantName)

                    Picker("Room", selection: $selectedRoom) {
                        ForEach(rooms, id: \.self) { room in
                            Text(room)
                        }
                    }

                    Picker("Light", selection: $selectedLight) {
                        ForEach(lightOptions, id: \.self) { light in
                            Text(light)
                        }
                    }

                    Picker("Water Days", selection: $selectedWaterDays) {
                        ForEach(waterDaysOptions, id: \.self) { days in
                            Text(days)
                        }
                    }

                    Picker("Water Amount", selection: $selectedWaterAmount) {
                        ForEach(waterAmounts, id: \.self) { amount in
                            Text(amount)
                        }
                    }
                }

                Section {
                    Button("Add Plant") {
                        let newPlant = Plant(
                            name: plantName,
                            room: selectedRoom,
                            light: selectedLight,
                            waterDays: selectedWaterDays,
                            waterAmount: selectedWaterAmount
                        )
                        viewModel.addPlant(newPlant)
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                }
            }
            .navigationTitle("Add New Plant")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
