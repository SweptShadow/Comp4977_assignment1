import SwiftUI

struct ZodiacListView: View {
    
    @StateObject private var viewModel = ZodiacViewModel()
    
    var body: some View {
        
        List(viewModel.signs) { sign in
            
            NavigationLink(destination: ZodiacDetailView(sign:sign)){
                
                VStack(alignment: .leading) {
                    Text(sign.name)
                        .font(.headline)
                    Text(sign.description)
                        .font(.subheadline)
                }
        
            }
            
        }
        .navigationTitle("Chinese Zodiac")
    }
}

