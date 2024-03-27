//
//  AddNewItemView.swift
//  MVVMCoreData
//
//  Created by Darshan on 25/02/24.
//

import SwiftUI

struct AddNewItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .listRowSeparatorLeading) {
                Text("New Category")
                    .font(.system(.headline))
                    .padding(.leading)
                TextField("Enter category name", text: $name).padding(.leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save",role: .none, action: saveItem)
                        .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                        .navigationTitle(Text("Add"))
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            Spacer()
        }
    }
    
    // Create and save newly added category/list item in coredata
    private func saveItem() {
        dismiss()
        withAnimation {
            let viewContext = PersistenceController.shared.container.viewContext
            let _ = Item(name: name, context: viewContext)
            PersistenceController.shared.save()
        }
    }
    
    struct AddNewItemView_Previews: PreviewProvider {
        static var previews: some View {
            AddNewItemView()
        }
    }
    
}

