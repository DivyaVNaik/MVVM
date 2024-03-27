//
//  ContentView.swift
//  MVVMCoreData
//
//  Created by Divya on 25/02/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    enum SortOption {
        case name, date
    }
    
    @State var isPresented = false
    @State private var sortOption: SortOption = .name
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Item>
    private var sortedItems: [Item] {
        switch sortOption {
        case .name:
            return items.sorted { $0.itemName < $1.itemName }
        case .date:
            return items.sorted { $0.creationTime  < $1.creationTime }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Picker("Sort by", selection: $sortOption) {
                    Text("Alpha").tag(SortOption.name)
                    Text("Created Date").tag(SortOption.date)
                }
                .pickerStyle(.segmented)
                .padding(8)
                List {
                    ForEach(sortedItems) { item in
                        NavigationLink {
                            let delegate = CatService()
                            CatListView(catViewModel: CatViewModel(catServiceDelegate: delegate))
                        } label: {
                            Text(item.itemName)
                        }
                    }
                }.listStyle(.plain)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {self.isPresented.toggle()}) {
                        Label("Add Item", systemImage: "plus")
                            .tint(.black)
                    }.sheet(isPresented: $isPresented) {
                        AddNewItemView()
                    }
                    .navigationTitle(Text("List"))
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

