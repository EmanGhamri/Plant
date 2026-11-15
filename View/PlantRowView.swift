import SwiftUI

struct PlantRowView: View {
    let plant: Plant
    let onToggle: () -> Void     // what to do when the circle is tapped
    
    var body: some View {
        HStack(spacing: 12) {
            
            // 1. The circle button
            Button {
                onToggle()
            } label: {
                Image(systemName: plant.isWatered ? "checkmark.circle.fill" : "circle")
                    .font(.title)
                    .foregroundStyle(plant.isWatered ? .green : .gray)
            }
            .buttonStyle(.plain)
            
            // 2. Room, name, and tags
            VStack(alignment: .leading, spacing: 6) {
                
                Label("in \(plant.room.rawValue)", systemImage: "location")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Text(plant.name)
                    .font(.title)
                    .foregroundStyle(plant.isWatered ? .gray : .white)
                
                HStack {
                    TagView(icon: "sun.max", text: plant.light.rawValue, color: plant.isWatered ? .gray : .yellow)
                    TagView(icon: "drop", text: plant.amount.rawValue, color: plant.isWatered ? .gray : .white)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    PlantRowView(
        plant: Plant(name: "Monstera",
                     room: .kitchen,
                     light: .full,
                     days: .oneW,
                     amount: .one),
        onToggle: { }
    )
    .preferredColorScheme(.dark)
}
