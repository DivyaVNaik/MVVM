//
//  MockCatAPIService.swift
//  MVVMCoreDataTests
//
//  Created by Divya on 2024-02-29.
//

import Foundation
@testable import MVVMCoreData

class MockCatAPIService: CatserviceDelegate {
    func fetchCatFacts() async throws -> [MVVMCoreData.CatFacts] {
        // add init
        let sample = CatFacts(text: "Cats can purr")
        return [sample]
    }
    
    
}
