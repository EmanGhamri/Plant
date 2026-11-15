import SwiftUI


struct ContentView: View {
    
    @State private var viewModel = PlantViewModel()
    @State private var showAddSheet = false
    
    var body: some View {
        
        NavigationStack {
            if viewModel.plants.isEmpty {
                VStack {
                    Image("Image")
                        .padding(.vertical,60)
                    
                    Text("Start your plant journey! ")
                    
                        .font(.system(size: 23, weight: .heavy))
                    
                    
                    Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,20 )
                        .padding(.vertical,10)
                    
                    
                    
                    
                    //Creating the Button and making the specification
                    
                    Button {
                        showAddSheet = true
                    } label: {
                        Text("Set Plant Reminder")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, minHeight: 25)
                            .padding(.vertical, 14)
                            .glassEffect(
                                .regular.tint(Color(red: 0.1, green: 0.4, blue: 0.3).opacity(0.8)).interactive(),
                                in: .capsule
                            )
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                }
                
                
                .padding(.bottom, 160)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("My Plants 🌱")
                            .font(.largeTitle.bold())
                            .padding(.horizontal, 20)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 1)
                            .padding(.leading, 20)
                    }
                    .padding(.top, 10)
                    
                }
                .toolbar(.hidden, for: .navigationBar)
            } else { PlantListView(viewModel: viewModel, onAdd: {
                showAddSheet = true
            })
            .navigationTitle("My Plants 🌱")
                
            }
            
        }
        .preferredColorScheme(.dark)
        .onAppear {
            NotificationManager.shared.requestPermission()
        }
        .sheet(isPresented: $showAddSheet) {
            AddPlantView(viewModel: viewModel)
        }
        .task {
            while !Task.isCancelled {
                viewModel.resetDuePlants()
                try? await Task.sleep(for: .seconds(1))
            }
        }
        
        
    }
    
    
}





#Preview {
    ContentView()
    
}
