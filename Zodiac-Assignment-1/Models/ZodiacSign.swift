/**
 @Author: Yujin Jeong
 @Author: Dalraj Bains
 @Author: Brian Diep
 */
import Foundation

struct ZodiacSign: Identifiable {
    
    let id = UUID()
    let name: String
    let emoji: String
    let imageName: String 
    let description: String
    let traits: String
    let compatibility: String
    let years: [Int]
    
}
