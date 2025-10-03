/**
 AnimalRowView.swift
 @Author: Yujin Jeong
 
 Home screen
 */

import SwiftUI

struct ZodiacHomeView: View {
    
    // View model holding a list of zodiac signs
    @StateObject private var viewModel = ZodiacViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack(spacing: 10) {
                    
                    // Looping through all zodiac signs from viewModel
                    ForEach(viewModel.signs) {
                        sign in
                        
                        // Each sign is a navigation link to detail view
                        NavigationLink(destination: ZodiacDetailView(sign: sign)) {
                            
                            // Animal row view
                            AnimalRowView(sign: sign)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 5)
                        }
                    }
                }
                .padding(.top, 25)
            }
            
            //App background color
            .background(AppColors.background.ignoresSafeArea())
            
            //Navigation bar title
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Chinese Zodiac")
                        .font(.largeTitle.bold())
                        .foregroundColor(AppColors.primary)
                        .baselineOffset(-30)
                }
            }
        }
        
        
//        NavigationView{
//            
//            List {
//                NavigationLink("Zodiac Calculator"){
//                    ZodiacCalculatorView()
//                }
//                NavigationLink("All Chinese Zodiac Signs"){
//                    ZodiacListView()
//                }
//                NavigationLink("About"){
//                    AboutView()
//                }
//            }
//            .navigationTitle("Zodiac Home")
//        }
    }
}
