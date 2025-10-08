/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 
 Display zodiac animal row
 */

import SwiftUI

// Single row that shows a zodiac emoji and its name. Used insida a list.
struct AnimalRowView: View {
    
    // Zodiac sign model
    let zodiacSign: ZodiacSign
    
    var body: some View {
        
        HStack {
            
            Text(zodiacSign.emoji)
                .font(.largeTitle)
                .frame(width: 44)
            
            Text(zodiacSign.name)
                .font(.headline.weight(.semibold))
                .foregroundColor(AppColors.text)
            
            Spacer()
        }
        .padding(14)
        
        // Card style background with rounded corners.
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(AppColors.cardBackground)
                .overlay(                     //This gives border around the card.
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(AppColors.primary.opacity(0.08), lineWidth: 1)
                )
                // Giving shadow effect so it looks like slightly lifted.
                .shadow(color: AppColors.shadow, radius: 6, x: 0, y: 3)
        )
    }
}

#Preview("Animal Row - From ViewModel") {
    AnimalRowView(zodiacSign: ZodiacViewModel().zodiacSigns[0])
        .padding()
        .background(AppColors.background)
}
