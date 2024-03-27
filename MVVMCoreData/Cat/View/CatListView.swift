//
//  CatListView.swift
//  MVVMCoreData
//
//  Created by Divya on 2024-02-28.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var catViewModel: CatViewModel
    @State var isLoading: Bool = true

    var body: some View {
        VStack {
            if self.isLoading {
                ProgressView("Loading cats...")
            } else {
                if catViewModel.filteredCatFacts.count == 0 {
                    Text("No Cats")
                } else {
                    List(catViewModel.filteredCatFacts) { facts in
                        CatFactsView(facts: facts)                        
                    }.listStyle(.grouped)
                }
            }
        }.searchable(text: $catViewModel.searchText)
        .onAppear {
            // Fetch data asynchronously when the view appears
            Task {
                    // Update UI to show loading indicato
                self.isLoading = true
                    // Fetch data asynchronously
                    
                await catViewModel.fetchCatFacts()
                    
                    // Update UI to hide loading indicator
                  self.isLoading = false

            }
        }.navigationTitle("Facts")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView(catViewModel: CatViewModel(catServiceDelegate: CatService()))
    }
    
    
}
