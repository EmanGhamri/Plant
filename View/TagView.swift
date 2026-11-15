import SwiftUI

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
