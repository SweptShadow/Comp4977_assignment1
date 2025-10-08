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
                    .foregroundColor(AppColors.text)
                
                VStack(alignment: .leading, spacing: 15) {
                    DetailSection(title: "Description", content: zodiacSign.description)
                    DetailSection(title: "Key Traits", content: zodiacSign.traits)
                    DetailSection(title: "Compatible With", content: zodiacSign.compatibility)
                    DetailSection(title: "Years", content: zodiacSign.years.map(String.init).joined(separator: ", "))
                }
            }
            .padding()

        }
        .background(
            LinearGradient(
                colors: [
                    AppColors.background,
                    AppColors.lightGreen.opacity(0.20),
                    AppColors.lightOrange.opacity(0.18)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
        
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            // This ToolbarItem for centering navigation title and font size bigger.
            ToolbarItem(placement: .principal) {
                Text("Chinese Zodiac")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(AppColors.text)
            }
        }
        // Change the colour of the navigation bar background to match the other page's theme
        .toolbarBackground(AppColors.background.opacity(0.95), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)

    }
    
    
}

struct DetailSection: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(AppColors.text)
            
            Text(content)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(AppColors.cardBackground)
                .shadow(color: AppColors.shadow, radius: 8, x: 0, y: 4)
        )
    }
}


#Preview("Zodiac Detail View") {
    NavigationStack {
        ZodiacDetailView(zodiacSign: ZodiacSign(
            name: "Dragon",
            emoji: "🐉",
            imageName: "dragon",
            description: "The Dragon is a symbol of power, strength, and good fortune in Chinese culture. Those born in the Year of the Dragon are believed to be confident, intelligent, and natural leaders.",
            traits: "Confident, Intelligent, Enthusiastic, Charismatic",
            compatibility: "Rat, Monkey, Rooster",
            years: [1928, 1940, 1952, 1964, 1976, 1988, 2000, 2012, 2024]
        ))
    }
}
