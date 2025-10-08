/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 
 The app's main screen. Displays the list of zodiac signs.
 */
import SwiftUI

struct ZodiacHomeView: View {
    
    // Shared data for the whole screen
    @EnvironmentObject var zodiacViewModel: ZodiacViewModel

    var body: some View {
        
        NavigationStack {
            
            //Display the list of zodiac signs
            ZodiacListView()
                .padding(.top, -12)
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
        .tint(AppColors.primary)
    }
}
