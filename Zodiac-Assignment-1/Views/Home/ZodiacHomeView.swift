import SwiftUI

struct ZodiacHomeView: View {
    
    var body: some View {
        
        NavigationView{
            
            List {
                NavigationLink("Zodiac Calculator"){
                    ZodiacCalculatorView()
                }
                NavigationLink("All Chinese Zodiac Signs"){
                    ZodiacListView()
                }
                NavigationLink("About"){
                    AboutView()
                }
            }
            .navigationTitle("Zodiac Home")
        }
    }
}
