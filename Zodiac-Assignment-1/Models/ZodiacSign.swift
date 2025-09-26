import Foundation

struct ZodiacSign: Identifiable {
    
    let id = UUID()
    let name: String
    let description: String
    let years: [Int]
    
}
