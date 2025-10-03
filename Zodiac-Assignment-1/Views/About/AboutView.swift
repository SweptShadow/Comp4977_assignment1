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
                    
                    Text("Chinese Zodiac App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.primary)
                    
                    VStack(spacing: 15) {
                        Text("About This App")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Chinese philosophy has revered astrology for millennia, intertwining with contemporary Chinese culture. Serving as a guide for over 3,000 years, predicting the fate of nations, outcomes of wars, economic trends, and much more, the Chinese zodiac is a significant and beautiful reflection of Chinese philosophy and culture.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    
                    VStack(spacing: 20) {
                        Text("Developed By")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.primary)
                        
                        VStack(spacing: 15) {
                            StudentInfoCard(name: "Yujin Jeong", studentID: "A0")
                            StudentInfoCard(name: "Dalraj Bains", studentID: "A0")
                            StudentInfoCard(name: "Brian Diep", studentID: "A0")
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
            .background(AppColors.background)
            .navigationTitle("About")
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
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
