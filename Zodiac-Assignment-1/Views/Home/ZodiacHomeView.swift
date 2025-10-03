/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 
 Home screen
 */

import SwiftUI

struct ZodiacHomeView: View {
    
    @EnvironmentObject var zodiacViewModel: ZodiacViewModel
    
    var body: some View {
        
        NavigationView {
            ZodiacListView()
                .navigationTitle("Chinese Zodiac")
                .background(AppColors.background)
        }
        .accentColor(AppColors.primary)
    }
}
