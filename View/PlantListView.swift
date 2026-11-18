import SwiftUI

struct PlantListView: View {
    var viewModel: PlantViewModel
    var onAdd: () -> Void
    @State private var selectedPlant: Plant?
    var body: some View {
        VStack(spacing: 0) {
            
            if viewModel.allWatered {
                AllDoneView()
            } else {
                ProgressHeaderView(
                    message: viewModel.statusMessage,
                    progress: viewModel.progress
                )
                
                List {
                    ForEach(viewModel.sortedPlants) { plant in
                        PlantRowView(plant: plant) {
                            viewModel.toggleWatered(plant)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if !plant.isWatered {
                                selectedPlant = plant
                            }
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                viewModel.deletePlant(plant)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }                }
                .listStyle(.plain)
            }}
        .overlay(alignment: .bottomTrailing) {
            Button {
                onAdd()
            } label: {
                Image(systemName: "plus")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(Color(red: 0.1, green: 0.4, blue: 0.3), in: Circle())
            }
            .padding(20)
        }
        
        .sheet(item: $selectedPlant) { plant in
            AddPlantView(viewModel: viewModel, plantToEdit: plant)
        }
    }
}


#Preview {
    let vm = PlantViewModel()
    vm.addPlant(Plant(name: "Monstera", room: .kitchen, light: .full, days: .oneW, amount: .one))
    vm.addPlant(Plant(name: "Pothos", room: .bedroom, light: .full, days: .E3D, amount: .one))
    vm.addPlant(Plant(name: "Orchid", room: .livingroom, light: .partial, days: .E2W, amount: .two))
    return PlantListView(viewModel: vm, onAdd: { })
        .preferredColorScheme(.dark)
}
