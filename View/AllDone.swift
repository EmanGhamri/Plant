import SwiftUI

struct AllDoneView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("Image 1")
                .padding(.vertical,20)
            
            
            Text("All Done! 🎉")
                .font(.title2.bold())
            
            
            Text("All Reminders Completed")
                .font(.callout)
                .foregroundStyle(.gray)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AllDoneView()
        .preferredColorScheme(.dark)
}
