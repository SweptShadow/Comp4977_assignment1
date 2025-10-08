/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 
 This file is for creating a cutom button style.
 Adding soft pastel gradietn button with animation.
 AppColors has our custom pastel tone colours.
 */

import SwiftUI

struct PastelButton: ButtonStyle {
    
    // This function is for building the button's appearance.
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
        
            // Give gradient effect behind the label text.
            .background(
                LinearGradient(
                    colors: [
                        AppColors.primary.opacity(0.95),
                        AppColors.lightPurple.opacity(0.75)
                    ],
                    startPoint: .topLeading,    // Gradient starts top-left
                    endPoint: .bottomTrailing   // Gradient ends bottom-right
                )
            )
            // Set label text white so visible with gradient
            .foregroundColor(.white)
            // Make button shape slightly round
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            // This giving shadow and shadow chages when button was pressed.
            .shadow(color: AppColors.shadow,
                    radius: configuration.isPressed ? 2 : 8, x: 0, y: configuration.isPressed ? 1 : 4)
            // While button is pressed, button size gets smaller to give pressed feeling
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            // This gives animation effect(quick press/release) only when button is clicked.
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
    
}
