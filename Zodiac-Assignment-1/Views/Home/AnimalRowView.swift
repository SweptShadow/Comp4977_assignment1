/**
 AnimalRowView.swift
 @Author: Yujin Jeong
 
 Displays zodiac animal row.
 */

// FIXME: Currently emoji and name is hardcoded

import SwiftUI

struct AnimalRowView: View {
    
    // Zodiac sign model
    let sign: ZodiacSign
    
    var body: some View {
        
        // Temp emoji + display name from helper method
        let info = zodiacInfo(for: sign.name)
        
        // Horizontal layout(Emoji, Animal name, Tap to learn more)
        HStack(spacing: 30) {
            
            // Emoji
            Text(info.emoji)
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .background(AppColors.cardBackground)
                .clipShape(Circle())
                .shadow(color: AppColors.shadow, radius: 2, x:1, y:1)
            
            // Veritcal layout(Animal name, Tap to learn more)
            VStack(alignment: .leading, spacing: 4) {
                
                // Animal name
                Text(info.displayName)
                    .font(.headline)
                    .foregroundColor(AppColors.primary)
                
                // Tap to learn more
                Text("Tap to learn more")
                    .font(.caption)
                    .foregroundColor(AppColors.secondary)
            }
        }
    }
    
    
    
    // TODO: Delete this later once I get animal images
    
    // Rreturning emoji and animal name from dictionary
    private func zodiacInfo(for zodiacSignName: String) -> (emoji: String, displayName: String) {
        
        let key = zodiacSignName.lowercased()
        if let info = Self.animalLookup[key] {
            return info
        }
        return ("❓", "Unknown Sign")
    }
    
    // TODO: Delete this later once I get animal images
    private static let animalLookup: [String: (emoji: String, displayName: String)] = [
        "rat":     ("🐭", "Rat"),
        "ox":      ("🐂", "Ox"),
        "tiger":   ("🐅", "Tiger"),
        "rabbit":  ("🐰", "Rabbit"),
        "dragon":  ("🐉", "Dragon"),
        "snake":   ("🐍", "Snake"),
        "horse":   ("🐎", "Horse"),
        "goat":    ("🐐", "Goat"),
        "monkey":  ("🐵", "Monkey"),
        "rooster": ("🐓", "Rooster"),
        "dog":     ("🐕", "Dog"),
        "pig":     ("🐖", "Pig")
    ]
}

