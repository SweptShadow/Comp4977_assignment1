/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 
 This file is for zodiac animal calculating page. Includes UI and logic to calculate the zodiac animal for user.
 */
import SwiftUI

struct ZodiacCalculatorView: View {
    
    @EnvironmentObject var zodiacViewModel: ZodiacViewModel
    @State private var calculatedSign: ZodiacSign?
    @State private var inputYear: String = ""
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Title and subtitle
                    HeaderCard()
                    
                    // Input box and buttons
                    InputCard(
                        inputYear: $inputYear,
                        onCalculate: calculateZodiac,
                        onClear: {
                            inputYear = ""
                            calculatedSign = nil
                        }
                    )
                    
                    // Display the result card only when we have a sign.
                    if let sign = calculatedSign {
                        ResultCard(sign: sign)
                            .transition(.opacity.combined(with: .scale))
                    }
                }
                .padding(.vertical, 16)
            }
            .padding(.top, -6)
            
            // Adding gradient background
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
            
            //Error alert for not able to pass validating input
            .alert("Invalid Input", isPresented: $showError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
            
            //This block of code is for centering and change the font style in the nav bar
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
        .tint(AppColors.primary)
    }
    
    
    //Validation function to get valid year
    private func calculateZodiac() {
        
        // Parse number from trimmed text
        guard let year = Int(inputYear.trimmingCharacters(in: .whitespaces)) else {
            
            errorMessage = "Please enter a valid year"
            showError = true
            
            return
        }
        
        // Basic range check
        guard year >= 1900 && year <= 2100 else {
            
            errorMessage = "Please enter a year between 1900 and 2100"
            showError = true
            
            return
        }
        
        // Get the sign of the year
        calculatedSign = zodiacViewModel.calculateZodiacSign(for: year)
    }
}

        // Top card with the title of this screen and guiding text for current screen.
        private struct HeaderCard: View {
            var body: some View {
                
                VStack(spacing: 8) {
                    
                    Text("Zodiac Calculator")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(AppColors.text)

                    Text("Enter your birth year to discover your Chinese zodiac animal")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                // Change the shape of card and give a bit of styles with colour and shadow
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(AppColors.cardBackground)
                        .shadow(color: AppColors.shadow, radius: 8, x: 0, y: 4)
                )
                .padding(.horizontal)
            }
        }
        
        // Card for input row and buttons(Calculate and clear)
        private struct InputCard: View {
            
            @Binding var inputYear: String
            var onCalculate: () -> Void
            var onClear: () -> Void

            var body: some View {
                VStack(spacing: 14) {
                    
                    // Row -> Calendar icon and text field
                    HStack(spacing: 12) {
                        Image(systemName: "calendar")
                            .font(.title3)
                            .foregroundColor(AppColors.secondary)

                        TextField("Enter Year (e.g., 1995)", text: $inputYear)
                            .font(.title3)
                    }
                    .padding(14)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(AppColors.background.opacity(0.7))
                            // Giving a border around text field
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .strokeBorder(AppColors.primary.opacity(0.15), lineWidth: 1)
                            )
                    )
                    
                    // Calculate button
                    Button(action: onCalculate) {
                        Text("Calculate")
                            .font(.title3.weight(.semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                    }
                    // Giving gradient style for the button
                    .buttonStyle(PastelButton())
                    .disabled(inputYear.isEmpty)
                    .opacity(inputYear.isEmpty ? 0.6 : 1)
                    
                    // Reset button
                    Button("Clear", action: onClear)
                        .font(.subheadline.weight(.semibold))
                        .tint(AppColors.secondary)
                }
                .padding()
                // Giving styled color and shadow in the card.
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(AppColors.cardBackground)
                        .shadow(color: AppColors.shadow, radius: 8, x: 0, y: 4)
                )
                .padding(.horizontal)
            }
        }
        
        // Display the reulst
        private struct ResultCard: View {
            
            let sign: ZodiacSign

            var body: some View {
                VStack(spacing: 12) {
                    Text(sign.emoji)
                        .font(.system(size: 84))

                    Text(sign.name)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(AppColors.primary)

                    Text("Key Traits")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text(sign.traits)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(AppColors.text)
                        .padding(.horizontal)
                }
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(
                    // Giving gradient style in the background
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: [
                                    AppColors.lightPurple.opacity(0.35),
                                    AppColors.lightYellow.opacity(0.35)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        // Giving border line around the result card
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(.white.opacity(0.6), lineWidth: 1)
                        )
                        .shadow(color: AppColors.shadow, radius: 10, x: 0, y: 6)
                )
                // Giving space around the card
                .padding(.horizontal)
            }
        }

#Preview("Zodiac Calculator View") {
    ZodiacCalculatorView()
        .environmentObject(ZodiacViewModel())
}
