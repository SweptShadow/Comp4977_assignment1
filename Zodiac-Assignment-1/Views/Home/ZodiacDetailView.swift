import SwiftUI

struct ZodiacDetailView: View {
    
    let sign: ZodiacSign
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                Text(sign.name)
                    .font(.largeTitle)
                    .bold()
                Text(sign.description)
                    .padding()
                
                
            }
            .padding()
        }
        .navigationTitle(sign.name)
    }
}
