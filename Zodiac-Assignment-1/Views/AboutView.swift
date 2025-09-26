import SwiftUI

struct AboutView: View {
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text("About the App")
                .font(.largeTitle)
                .bold()
            
            Text("App is for zodiac assignment")
                .multilineTextAlignment(.center)
                .padding()
            
        }
        .padding()
        .navigationTitle("About")
    }
    
}
