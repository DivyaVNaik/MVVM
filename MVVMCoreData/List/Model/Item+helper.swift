//
//  Item+helper.swift
//  MVVMCoreData
//
//  Created by Divya on 26/02/24.
//

import Foundation
import CoreData

extension Item {
    
    convenience init(name: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.name = name
    }
    
    var creationTime: Date {
        get {
            timestamp ?? Date()
        }
        set {
            timestamp = newValue
        }
    }
    
    var itemName: String{
        get {
            name ?? ""
        }
        set {
            name = newValue
        }
    }
    
    public override func awakeFromInsert() {
        setPrimitiveValue(Date(), forKey: "timestamp")
        setPrimitiveValue(UUID(), forKey: "id")
    }
    
    func fetch()  -> NSFetchRequest<Item> {
        let req = Item.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(keyPath: \Item.name, ascending: true)]
        return req        
    }
    
}
