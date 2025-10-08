/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 */
import SwiftUI

struct AboutView: View {
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: 30) {
                
                    VStack(spacing: 15) {
                        Text("About This App")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(AppColors.text)
                        
                        Text("Chinese philosophy has revered astrology for millennia, intertwining with contemporary Chinese culture. Serving as a guide for over 3,000 years, predicting the fate of nations, outcomes of wars, economic trends, and much more, the Chinese zodiac is a significant and beautiful reflection of Chinese philosophy and culture.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(AppColors.cardBackground)
                            .shadow(color: AppColors.shadow, radius: 8, x: 0, y: 4)
                    )
                    
                    VStack(spacing: 20) {
                        Text("Developed By")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(AppColors.text)
                        
                        VStack(spacing: 15) {
                            StudentInfoCard(name: "Yujin Jeong", studentID: "A01310724")
                            StudentInfoCard(name: "Dalraj Bains", studentID: "A01384780")
                            StudentInfoCard(name: "Brian Diep", studentID: "A00959233")
                        }
                        
                        
                    }
                    
                    VStack(spacing: 5) {
                        Text("Version 1.0")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("2025 Zodiac Assignment 1")
                            .font(.caption)
                            .foregroundColor(.secondary)
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
                ToolbarItem(placement: .principal) {
                    Text("Chinese Zodiac")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(AppColors.text)
                }
            }
            .toolbarBackground(AppColors.background.opacity(0.95), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        .accentColor(AppColors.primary)
        
    }
}

struct StudentInfoCard: View {
    
    let name: String
    let studentID: String
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            Text(name)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Student ID: \(studentID)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(AppColors.cardBackground)
                .shadow(color: AppColors.shadow, radius: 8, x: 0, y: 4)
        )
    }
}

#Preview
{
    AboutView()
}
