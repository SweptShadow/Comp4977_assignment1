/**
 @Author: Dalraj Bains
 @Author: Yujin Jeong
 @Author: Brian Diep
 
 This file is for creating a list of zodiac animals for home view.
 */
import SwiftUI

struct ZodiacListView: View {
    
    // Shared data(zodiac animal info)
    @EnvironmentObject var zodiacData: ZodiacViewModel
    // Search box from user input
    @State private var searchTerm = ""

    // Signs to show after applying the search
    private var visibleSigns: [ZodiacSign] {
        
        // Cleaning the user input and ignore case
        let query = searchTerm.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        // This will show all animals if search is empty, else shows the result that contins the animal.
        return query.isEmpty
            ? zodiacData.zodiacSigns
            : zodiacData.zodiacSigns.filter { $0.name.lowercased().contains(query) }
    }
    

    var body: some View {
        
        // Scrollable list of rows
        List {
            
            ForEach(visibleSigns) { zodiac in
                
                // Tapping animal row goes to the detail screen
                NavigationLink(destination: ZodiacDetailView(zodiacSign: zodiac)) {
                    AnimalRowView(zodiacSign: zodiac)
                        .padding(.vertical, 2)
                }
                // This 3 lines of code below disable list's default style
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        // Hiding default list background colour.
        .scrollContentBackground(.hidden)
        
        // Setting background colour as gradient effect. (Behind the list)
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
            .ignoresSafeArea()  // Extending gradient under safe areas
        )
        //Search bar for making user can search zodiac animal
        .searchable(
            text: $searchTerm,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search by name"
        )
        // animate(refresh) list as search changes
        .animation(.snappy, value: searchTerm)
    }
}
