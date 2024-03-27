//
//  CatViewModel.swift
//  MVVMCoreData
//
//  Created by Divya on 2024-02-28.
//

import Foundation


class CatViewModel: ObservableObject {
    
    @Published var catFacts: [CatFacts] = []
    @Published var error: Error?
    @Published var searchText: String = ""

    var catServiceDelegate: CatserviceDelegate
    
    var filteredCatFacts:  [CatFacts]  {
        guard !searchText.isEmpty else { return catFacts }
        return catFacts.filter { catFact in
            catFact.text!.lowercased().contains(searchText.lowercased())}
    }
    
    init(catServiceDelegate: CatserviceDelegate) {
        self.catServiceDelegate = catServiceDelegate
    }
    
    // Fetch Cat Facts from Backend server call
    func fetchCatFacts() async  {
        do {
           let data =  try await catServiceDelegate.fetchCatFacts()
            DispatchQueue.main.async {
                self.catFacts = data
            }
        } catch  {
            self.error = error as Error
        }
    }
    
    func fetchCatFactsWithClosure() {
        CatService().fetchCatFactsWith(completion: { [weak self] result in
            switch result {
            case .success(let catFacts):
                self?.catFacts = catFacts
            case .failure(let error):
                self?.error = error
            }
        })
    }
    
}
