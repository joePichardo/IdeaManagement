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
            ScrollView {
                Button(action: {self.addCategory()}) {
                    HStack {
                        Text("Add New Category").foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.right.circle.fill")
                    }
                    .font(.headline)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 1, y: 1)
                }.accentColor(Color.green)
                .padding([.leading, .trailing], 10)
                
                ForEach(store.categories.identified(by: \.id)) {
                    category in
                    if (self.store.categories.firstIndex(of: category) ?? 1) % 2 == 0 {
                        CategoryCell(category: category, categories: self.store.categories)
                    }
                    
                }
                .padding([.leading, .trailing], 10)
                .accentColor(Color.pink)
                .onDelete(perform: delete)
                .onMove(perform: move)
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
    var categories: [Category]
    
    var body: some View {
        HStack {
            NavigationLink(destination: BallotDetail(store: BallotStore(ballots: category.ballots))) {
                CategoryCellItem(name: category.name)
            }
            IfLet(categories.firstIndex(of: category)) { index in
                Group {
                    if self.categories.indices.contains(index + 1) {
                        NavigationLink(destination: BallotDetail(store: BallotStore(ballots: self.categories[index + 1].ballots))) {
                            CategoryCellItem(name: self.categories[index + 1].name)
                        }
                    } else {
                        Spacer()
                            .padding()
                    }
                }
            }
        }
    }
}

struct CategoryCellItem: View {
    var name: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(name).foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right.circle.fill")
            }
        }.frame(height: (UIScreen.main.bounds.width / 2) - 60)
            .font(.headline)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 1, y: 1)
    }
}

struct IfLet<T, Out: View>: View {
    let value: T?
    let produce: (T) -> Out
    
    init(_ value: T?, produce: @escaping (T) -> Out) {
        self.value = value
        self.produce = produce
    }
    
    var body: some View {
        Group {
            if value != nil {
                produce(value!)
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
