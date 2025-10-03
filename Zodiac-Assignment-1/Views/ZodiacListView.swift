/**
 @Author: Dalraj Bains
 @Author: Yujin Jeong
 @Author: Brian Diep
 */
import SwiftUI

struct ZodiacListView: View {
    @EnvironmentObject var zodiacViewModel: ZodiacViewModel
    
    var body: some View {
        
        List {
            
            ForEach(zodiacViewModel.zodiacSigns) { sign in
                NavigationLink(destination: ZodiacDetailView(zodiacSign: sign)) {
                    AnimalRowView(zodiacSign: sign)
                }
                .listRowBackground(AppColors.cardBackground)
            }
        }
        .background(AppColors.background)
        .scrollContentBackground(.hidden)
    }
}
