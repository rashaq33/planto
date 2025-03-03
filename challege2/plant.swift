import SwiftUI

// الشاشة الرئيسية لعرض قائمة النباتات
struct PlantListView: View {
    @StateObject var viewModel = PlantViewModel()
    @State private var selectedPlant: Plant? // لتعديل النبتة
    @State private var showAddPlantPopup = false // لإظهار شاشة إضافة نبتة جديدة
    
    var body: some View {
        NavigationView {
            VStack {
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                   

                Divider()
                if viewModel.plants.isEmpty {
                    if viewModel.totalTasksCount > 0 {
                        VStack {
                            Image("done")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                            Text("Well Done 🎉")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.top, 20)
                            Text("All Reminders Completed")
                            
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 33.0)
                                .padding(.top, 10)
                                .foregroundColor(.gray)
                            Spacer()
               Button(action: {
                                showAddPlantPopup = true
                            }) {
                                Text("Set Plant Reminder")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        VStack {
                            Image("planto1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                            Text("Start your plant journey!")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.top, 20)
                            Text("Now all your plants will be in one place and we will help you take care of them ;)🪴")
                            
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 33.0)
                                .padding(.top, 10)
                                .foregroundColor(.gray)
                            
                            
                            Spacer()
                            Button(action: {
                                showAddPlantPopup = true
                            }) {
                                Text("Set Plant Reminder")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    }
                } else {
                    List {
                        ForEach(viewModel.plants.indices, id: \.self) { index in
                            HStack {
                                       Button(action: {
                                    withAnimation {
                                        viewModel.toggleCheck(for: index)
                                    }
                                }) {
                                    Image(systemName: "circle")
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                VStack(alignment: .leading, spacing: 4) {
                                         Label("in \(viewModel.plants[index].room)", systemImage: "location")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        Text(viewModel.plants[index].name)
                                        .font(.headline)
                                        .foregroundColor(.text1)
                                       HStack {
                                        Label(viewModel.plants[index].light, systemImage: "sun.max.fill")
                                            .foregroundColor(.yellow)
                                        Label(viewModel.plants[index].waterAmount, systemImage: "drop.fill")
                                            .foregroundColor(.blue)
                                    }
                                    .font(.caption)
                                }
                                
                                Spacer()
                                
                                // زر تعديل النبتة
                                Button(action: {
                                    selectedPlant = viewModel.plants[index]
                                }) {
                                    Image(systemName: "pencil.circle")
                                        .foregroundColor(.blue)
                                }
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    viewModel.deletePlant(at: index)
                                } label: {
                                    Label("حذف", systemImage: "trash")
                                }
                            }
                        }
                    }

                    .transition(.opacity)
                      
                    Button(action: {
                        showAddPlantPopup = true
                    }) {
                        Text("Set Plant Reminder")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            
            .onAppear {
                viewModel.loadPlants()
            }
            .sheet(isPresented: $showAddPlantPopup) {
                AddPlantView(viewModel: viewModel)
            }
            .sheet(item: $selectedPlant) { plant in
                if let binding = binding(for: plant) {
                    EditPlantView(plant: binding)
                } else {
                    Text("something wrong")
                }
            }
        }
    }
     private func binding(for plant: Plant) -> Binding<Plant>? {
        guard let index = viewModel.plants.firstIndex(where: { $0.id == plant.id }) else {
            return nil
        }
        return $viewModel.plants[index]
    }
}
#Preview {
    PlantListView()
}
