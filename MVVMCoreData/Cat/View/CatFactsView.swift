//
//  CatFactsView.swift
//  MVVMCoreData
//
//  Created by Divya on 2024-03-06.
//

import SwiftUI

struct CatFactsView: View {
    var facts: CatFacts
    
    var body: some View {
        HStack(alignment: .top) {
            Image("cat")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(40)
    
            VStack(alignment: .leading, spacing: 8.0) {
                Text(facts.type ?? "cat").bold()
                Text(facts.text ?? "")
            }
            
        }
    }
}

struct CatFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactsView(facts:CatFactsProvider.getCatFAct())
    }
}

struct CatFactsProvider {
    static func getCatFAct() -> CatFacts {
        return CatFacts(text: "cats can sing, fly, do meow")
    }
}
