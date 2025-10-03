/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 */
import SwiftUI

struct ZodiacCalculatorView: View {
    
    @EnvironmentObject var zodiacViewModel: ZodiacViewModel
    @State private var inputYear: String = ""
    @State private var calculatedSign: ZodiacSign?
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 30) {
                
                Text("Zodiac Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.primary)
                
                Text("Enter your birth year to discover your Chinese zodiac animal")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                VStack(spacing: 20) {
                    
                    TextField("Enter Year (e.g., 1995)", text: $inputYear)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .font(.title2)
                    
                    Button(action: calculateZodiac) {
                        
                        Text("Calculate")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppColors.primary)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                if let sign = calculatedSign {
                    
                    VStack(spacing: 15) {
                        
                        Text(sign.emoji)
                            .font(.system(size: 80))
                        
                        Text(sign.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.primary)
                        
                        Text("Key Traits:")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(sign.traits)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding()
            .alert("Invalid Input", isPresented: $showError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
            .padding()
            .background(AppColors.background)
        }
        .accentColor(AppColors.primary)
        
    }
    
    private func calculateZodiac() {
        
        guard let year = Int(inputYear) else {
            
            errorMessage = "Please enter a valid year"
            showError = true
            
            return
        }
        
        guard year >= 1900 && year <= 2100 else {
            
            errorMessage = "Please enter a year between 1900 and 2100"
            showError = true
            
            return
        }
        
        calculatedSign = zodiacViewModel.calculateZodiacSign(for: year)
    }
}
