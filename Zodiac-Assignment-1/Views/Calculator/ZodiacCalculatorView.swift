import SwiftUI

struct ZodiacCalculatorView: View {
    
    @State private var selectedDate = Date()
    @StateObject private var viewModel = ZodiacViewModel()
    @State private var result: ZodiacSign?
    
    var body: some View {
        VStack(spacing: 10){
            DatePicker("Select your birtdate", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
            
            Button("Calculate Chinese Zodiac") {
                let year = Calendar.current.component(.year, from: selectedDate)
                result = viewModel.sign(for: year)
            }
            .buttonStyle(.borderedProminent)
            
            if let sign = result {
                NavigationLink(destination: ZodiacDetailView(sign:sign)) {
                    Text("You are a \(sign.name)!")
                        .font(.headline)
                }
            }
        }
        .padding()
        .navigationTitle("Zodiac Calculator")
    }
}
