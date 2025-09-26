import Foundation
import Combine

class ZodiacViewModel: ObservableObject {
    
    @Published var signs: [ZodiacSign] = [
        ZodiacSign(name: "Rat", description: "a", years: [ 2008, 2020, 2032]),
        ZodiacSign(name: "Ox", description: "a", years: [ 2009, 2021, 2033]),
        ZodiacSign(name: "Tiger", description: "a", years: [ 2010, 2022, 2034]),
        ZodiacSign(name: "Rabbit", description: "a", years: [ 2011, 2023, 2035]),
        ZodiacSign(name: "Dragon", description: "a", years: [ 2012, 2024, 2036]),
        ZodiacSign(name: "Snake", description: "a", years: [ 2013, 2025, 2037]),
        ZodiacSign(name: "Horse", description: "a", years: [ 2014, 2026, 2038]),
        ZodiacSign(name: "Goat", description: "a", years: [ 2015, 2027, 2039]),
        ZodiacSign(name: "Monkey", description: "a", years: [ 2016, 2028, 2040]),
        ZodiacSign(name: "Roster", description: "a", years: [ 2017, 2029, 2041]),
        ZodiacSign(name: "Dog", description: "a", years: [ 2018, 2030, 2042]),
        ZodiacSign(name: "Pig", description: "a", years: [ 2019, 2031, 2043])
    ]
    
    func sign (for year: Int) -> ZodiacSign? {
        
        // Chinese Zodiac repeat every 12 year & using 2008 as base because that was year of rat
        let cycle = ["Rat","Ox","Tiger","Rabbit","Dragon","Snake","Horse","Goat","Monkey","Roster","Dog","Pig"]
        let index = (year - 2008) % 12
        let normalizedIndex = (index + 12) % 12
        let signName = cycle[normalizedIndex]
        
        return signs.first { $0.name == signName}
    }
}
