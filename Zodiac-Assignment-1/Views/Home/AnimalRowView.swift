/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 
 Display zodiac animal row
 */

// FIXME: Currently emoji and name is hardcoded

import SwiftUI

struct AnimalRowView: View {
    
    // Zodiac sign model
    let zodiacSign: ZodiacSign
    
    var body: some View {
        HStack {
            Text(zodiacSign.emoji)
                .font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(zodiacSign.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(AppColors.text)
                
                Text(zodiacSign.traits)
                    .font(.caption)
                    .foregroundColor(AppColors.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(AppColors.primary)
                .font(.caption)
        }
        .padding(.vertical, 8)
        .background(AppColors.cardBackground)
    }
}
