//
//  CatServiceTest.swift
//  MVVMCoreDataTests
//
//  Created by Divya on 2024-02-29.
//

import XCTest
@testable import MVVMCoreData

final class CatServiceTest: XCTestCase {
    
    var mockCatService : CatserviceDelegate!
    
    override func setUp() {
        super.setUp()
        mockCatService = MockCatAPIService()
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_fetch_cat_facts() async  throws {
        let facts = try await mockCatService.fetchCatFacts()
        
        XCTAssertNotNil(facts, "Cat Facts cannot be nil")
        XCTAssertNotNil(facts.first!.text, "Cat description cant br nil")
    }
}
