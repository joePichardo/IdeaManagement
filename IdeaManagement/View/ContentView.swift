//
//  ContentView.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/20/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView : View {
    
    @EnvironmentObject var store: CategoryStore
    
    var body: some View {
        NavigationView {
            ScrollView {
                Button(action: {
                    self.store.create(name: "hi")
                }) {
                    addCategoryButton().padding([.leading, .trailing], 10)
                }
                
//                NavigationLink(destination: addCategoryForm()) {
//                    addCategoryButton()
//                }
//                .accentColor(Color.green)
//                .padding([.leading, .trailing], 10)
                
                ForEach(store.categories, id: \.id) {
                    category in
                    if (self.store.categories.firstIndex(of: category) ?? 1) % 2 == 0 {
                        ZStack {
                            CategoryCell(category: category, categories: self.store.categories)
                        }
                    }
                    
                }
                .padding([.leading, .trailing], 10)
                .accentColor(Color.white)
            }
            .navigationBarTitle(Text("Categories"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(.grouped)
        }
    }
    
    func addCategory() {
//        store.categories.insert(Category(name: "Test Category", ballots: ballotTestData), at: 0)
    }
    
    func delete(at offsets: IndexSet) {
//        if let first = offsets.first {
//            store.categories.remove(at: first)
//        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        
//        // sort the indexes low to high
//        let reversedSource = source.sorted()
//
//        // then loop from the back to avoid reordering problems
//        for index in reversedSource.reversed() {
//            // for each item, remove it and insert it at the destination
//            store.categories.insert(store.categories.remove(at: index), at: destination)
//        }
    }
}

struct addCategoryButton : View {
    var body: some View {
        return HStack {
            Text("Add New Category").foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right.circle.fill")
        }
        .font(.headline)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 3, y: 0)
    }
}

struct deleteCategoryButton : View {
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.5))
                    .blur(radius: 20)
                    .frame(width: 40, height: 40)
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
        }
        .font(.headline)
        .background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.5))
        .cornerRadius(8)
        .shadow(radius: 3, y: 0)
    }
}

struct addCategoryForm : View {
    var body: some View {
        Text("Content")
            .navigationBarTitle(Text("Add New Category"))
            .navigationBarItems(trailing: Text("Done"))
    }
}

struct CategoryCell: View {
    @EnvironmentObject var store: CategoryStore
    var category: Category
    var categories: [Category]
    
    var body: some View {
        HStack {
            ZStack {
                NavigationLink(destination: Text("hi")) {
                    CategoryCellItem(category: category)
                }
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            self.store.deleteById(id: self.category.id)
                        }) {
                            deleteCategoryButton()
                        }
                        Spacer()
                    }
                }
                .frame(height: (UIScreen.main.bounds.width / 2) - 60)
                .padding()
            }
            
            // This is the right side category, then spacer is for consistent spacingon right edge
            IfLet(categories.firstIndex(of: category)) { index in
                Group {
                    if self.categories.indices.contains(index + 1) {
                        ZStack {
                            NavigationLink(destination: Text("hi")) {
                                CategoryCellItem(category: self.categories[index + 1])
                            }
                            HStack {
                                Spacer()
                                VStack {
                                    Button(action: {
                                        self.store.deleteById(id: self.categories[index + 1].id)
                                    }) {
                                        deleteCategoryButton()
                                    }
                                    Spacer()
                                }
                            }
                            .frame(height: (UIScreen.main.bounds.width / 2) - 60)
                            .padding()
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
    var category: Category
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(self.category.name)
                        .foregroundColor(.white)
                        .lineLimit(2)
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 30, height: 2)
                        .cornerRadius(1)
                }
                Spacer()
                Image(systemName: "chevron.right.circle.fill")
            }
        }
        .frame(height: (UIScreen.main.bounds.width / 2) - 60)
        .frame(minHeight: 100, maxHeight: 200)
        .font(.headline)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 0.56, green: 0.02, blue: 1.00, opacity: 1.0), Color(.sRGB, red: 0.13, green: 0.98, blue: 0.84, opacity: 1.0)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)), cornerRadius: 0)
        .cornerRadius(30)
        .shadow(radius: 5, y: 0)
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
        ContentView().environmentObject(CategoryStore())
    }
}
#endif
