import SwiftUI

struct PlantRowView: View {
    let plant: Plant
    let onToggle: () -> Void
    
    // what to do when the circle is tapped
    var body: some View {
        
        HStack(spacing: 12) {
            // 1. The circle button
            Button {
                onToggle()
            } label: {
                Image(
                    systemName: plant.isWatered ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundStyle(plant.isWatered ? Color(red: 40/255, green: 224/255, blue: 168/255) : .gray)
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
                    TagView(icon: "sun.max", text: plant.light.rawValue, color: plant.isWatered ? .gray : Color(red: 204/255, green: 199/255, blue: 133/255))
                    
                    
                    TagView(icon: "drop", text: plant.amount.rawValue, color: plant.isWatered ? .gray : Color(red: 202/255, green: 243/255, blue: 251/255))}
            }
        }
        .padding(.vertical, 8)
    }
}

/// TagView
struct TagView: View {
    let icon: String      // the SF Symbol name
    let text: String      // the words inside the tag
    let color: Color      // the color of the icon and text
    
    var body: some View {
        Label(text, systemImage: icon)
            .font(.callout)
            .foregroundStyle(color)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.white.opacity(0.1), in: Capsule())
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
