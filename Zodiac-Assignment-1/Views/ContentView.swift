/**
 @Author: Dalraj Bains
 @Author: Yujin Jeong
 @Author: Brian Diep
 */
import SwiftUI

struct ContentView: View {
    
    @StateObject private var zodiacData = ZodiacViewModel()
    
    var body: some View {
        
        TabView {
            ZodiacHomeView()
                .environmentObject(zodiacData)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ZodiacCalculatorView()
                .environmentObject(zodiacData)
                .tabItem {
                    Image(systemName: "x.squareroot")
                    Text("Calculator")
                }
            
            AboutView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About")
                }
        }
        .tint(AppColors.primary)
        .background(AppColors.background)
    }
    
}

#Preview {
    ContentView()
}
