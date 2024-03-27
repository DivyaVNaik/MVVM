//
//  MVVMCoreDataTests.swift
//  MVVMCoreData
//
//  Created by Divya on 25/02/24.
//

import XCTest
import CoreData
@testable import MVVMCoreData

final class MVVMCoreDataTests: XCTestCase {
    
    var controller: PersistenceController!
    
    var viewContext: NSManagedObjectContext {
        controller.container.viewContext
    }

    override func setUp() {
        super.setUp()
        controller = PersistenceController.empty
     }

    override func tearDown() {
        super.tearDown()
        controller = nil
    }

    func test_Add_item() {
        let item = Item(name: "Shirt", context: viewContext)
        XCTAssertNotNil(item, "Item cannot be nil")
        XCTAssertEqual(item.name, "Shirt")
    }


}
