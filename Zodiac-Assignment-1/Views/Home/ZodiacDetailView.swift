/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 
 Detail View
 */
import SwiftUI

struct ZodiacDetailView: View {
    let zodiacSign: ZodiacSign
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                Image(zodiacSign.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(color: AppColors.shadow, radius: 10, x: 0, y: 5)
                
                Text(zodiacSign.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.primary)
                
                VStack(alignment: .leading, spacing: 15) {
                    DetailSection(title: "Description", content: zodiacSign.description)
                    DetailSection(title: "Key Traits", content: zodiacSign.traits)
                    DetailSection(title: "Compatible With", content: zodiacSign.compatibility)
                    DetailSection(title: "Years", content: zodiacSign.years.map(String.init).joined(separator: ", "))
                }
            }
            .padding()
        }
        .navigationTitle(zodiacSign.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailSection: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(AppColors.primary)
            
            Text(content)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
