import SwiftUI

struct ContentView: View {
//    @StateObject private var zodiacData = ZodiacData()
    
    var body: some View {
        
        TabView {
            ZodiacHomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ZodiacCalculatorView()
                .tabItem {
                    Image(systemName: "calculator")
                    Text("Calculator")
                }
            
            AboutView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About")
                }
        }
        .tint(AppColors.primary)
    }
    
}

#Preview {
    ContentView()
}
