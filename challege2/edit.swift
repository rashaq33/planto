
import SwiftUI

struct EditPlantView: View {
    @Binding var plant: Plant
    @Environment(\.presentationMode) var presentationMode
    
    let rooms = ["Living Room", "Kitchen", "Balcony", "Bathroom"]
    let lightOptions = ["Full Sun", "Partial Sun", "Low Sun"]
    let waterDaysOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmountOptions = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Plant Name")) {
                    TextField("Enter plant name", text: $plant.name)
                }

                Section(header: Text("Room")) {
                    Picker("Select Room", selection: $plant.room) {
                        ForEach(rooms, id: \.self) { room in
                            Text(room).tag(room)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Light")) {
                    Picker("Select Light", selection: $plant.light) {
                        ForEach(lightOptions, id: \.self) { light in
                            Text(light).tag(light)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Water Days")) {
                    Picker("Select Watering Frequency", selection: $plant.waterDays) {
                        ForEach(waterDaysOptions, id: \.self) { days in
                            Text(days).tag(days)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Water Amount")) {
                    Picker("Select Water Amount", selection: $plant.waterAmount) {
                        ForEach(waterAmountOptions, id: \.self) { amount in
                            Text(amount).tag(amount)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .navigationTitle("Edit Plant")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}



