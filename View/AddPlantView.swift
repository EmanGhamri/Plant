import SwiftUI

struct AddPlantView: View {
    var viewModel: PlantViewModel
    var plantToEdit: Plant? = nil
    @Environment(\.dismiss) private var dismiss
    
    // What the user is typing or choosing
    @State private var name: String
    @State private var room: PlantLocation
    @State private var light: LightCondition
    @State private var days: WateringDays
    @State private var amount: WateringAmount
    
    init(viewModel: PlantViewModel, plantToEdit: Plant? = nil) {
        self.viewModel = viewModel
        self.plantToEdit = plantToEdit
        _name = State(initialValue: plantToEdit?.name ?? "")
        _room = State(initialValue: plantToEdit?.room ?? .bedroom)
        _light = State(initialValue: plantToEdit?.light ?? .full)
        _days = State(initialValue: plantToEdit?.days ?? .EveryDay)
        _amount = State(initialValue: plantToEdit?.amount ?? .one)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    HStack {
                        Text("Plant Name")
                        TextField("Pothos", text: $name)
                    }
                }
                
                Section {
                    Picker(selection: $room) {
                        ForEach(PlantLocation.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    } label: {
                        Label("Room", systemImage: "location")
                    }
                    
                    Picker(selection: $light) {
                        ForEach(LightCondition.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    } label: {
                        Label("Light", systemImage: "sun.max")
                    }
                }
                
                Section {
                    Picker(selection: $days) {
                        ForEach(WateringDays.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    } label: {
                        Label("Watering Days", systemImage: "drop")
                    }
                    
                    Picker(selection: $amount) {
                        ForEach(WateringAmount.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    } label: {
                        Label("Water", systemImage: "drop")
                    }
                }
                if let plant = plantToEdit {
                    Section {
                        Button(role: .destructive) {
                            viewModel.deletePlant(plant)
                            dismiss()
                        } label: {
                            Text("Delete Reminder")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .navigationTitle("Set Reminder")
            .tint(.white)
            
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        savePlant()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.glassProminent)     // NEW: fills the button with color
                    .tint(Color(red: 0.1, green: 0.4, blue: 0.3).opacity(0.8))
                    .disabled(name.isEmpty)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    private func savePlant() {
        if var plant = plantToEdit {
            // EDIT: change the existing plant
            plant.name = name
            plant.room = room
            plant.light = light
            plant.days = days
            plant.amount = amount
            viewModel.updatePlant(plant)
        } else {
            // ADD: create a new plant
            viewModel.addPlant(Plant(name: name,
                                     room: room,
                                     light: light,
                                     days: days,
                                     amount: amount))
        }
        dismiss()
    }}

#Preview {
    AddPlantView(viewModel: PlantViewModel())
}
