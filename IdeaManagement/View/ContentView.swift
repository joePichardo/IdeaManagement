//
//  ContentView.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/20/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObjectBinding var store = CategoryStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addCategory) {
                        Text("Add Category")
                    }
                }
                Section {
                    ForEach(store.categories.identified(by: \.id)) { category in
                        CategoryCell(category: category)
                    }.onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Categories"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(.grouped)
        }
    }
    
    func addCategory() {
        store.categories.insert(Category(name: "Test Category", ballots: ballotTestData), at: 0)
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            store.categories.remove(at: first)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        
        // sort the indexes low to high
        let reversedSource = source.sorted()
        
        // then loop from the back to avoid reordering problems
        for index in reversedSource.reversed() {
            // for each item, remove it and insert it at the destination
            store.categories.insert(store.categories.remove(at: index), at: destination)
        }
    }
}

struct CategoryCell: View {
    var category: Category
    
    var body: some View {
        NavigationButton(destination: BallotDetail()) {
            ZStack {
                Circle()
                    .foregroundColor(Color.red)
                Text("100")
                    .foregroundColor(Color.white)
                    .font(.body)
            }.frame(width: 50.0)
            VStack(alignment: .leading) {
                Text(category.name)
                Text("\(category.ballots.count) Lists")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(store: CategoryStore(categories: categoryTestData) )
    }
}
#endif
