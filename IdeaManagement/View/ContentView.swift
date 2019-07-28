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
    @State var showModalAddCategory = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Button(action: {
                    self.showModalAddCategory.toggle()
                }) {
                    addCategoryButton().padding([.leading, .trailing], 10)
                }
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
        }.sheet(isPresented: $showModalAddCategory, content: { modalAddCategory(store: self.store, showModal: self.$showModalAddCategory) })
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

struct modalAddCategory: View {
    var store: CategoryStore
    @Binding var showModal: Bool
    @State var categoryName = ""
    
    @State var colorOneR: Double = 0
    @State var colorOneG: Double = 0
    @State var colorOneB: Double = 0
    @State var colorOneA: Double = 1
    
    @State var colorTwoR: Double = 0
    @State var colorTwoG: Double = 0
    @State var colorTwoB: Double = 0
    @State var colorTwoA: Double = 1
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showModal.toggle()
                            self.categoryName = ""
                        }) {
                            Text("Cancel")
                        }
                    }
                    CategoryCellItemEmpty(categoryName: $categoryName, colorOneR: $colorOneR, colorOneG: $colorOneG, colorOneB: $colorOneB, colorOneA: $colorOneA, colorTwoR: $colorTwoR, colorTwoG: $colorTwoG, colorTwoB: $colorTwoB, colorTwoA: $colorTwoA)
                    TextField("Enter the category name", text: $categoryName)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    VStack(alignment: .leading) {
                        Text("Color One")
                            .lineLimit(nil)
                            .font(.title)
                        HStack {
                            VStack(alignment: .leading) {
                                Spacer()
                                Text("Red")
                                Spacer()
                                Text("Green")
                                Spacer()
                                Text("Blue")
                                Spacer()
                                Text("Opacity")
                                Spacer()
                            }.padding([.trailing], 15)
                            VStack {
                                Spacer()
                                Slider(value: $colorOneR, from: 0, through: 1, by: 0.01)
                                Spacer()
                                Slider(value: $colorOneG, from: 0, through: 1, by: 0.01)
                                Spacer()
                                Slider(value: $colorOneB, from: 0, through: 1, by: 0.01)
                                Spacer()
                                Slider(value: $colorOneA, from: 0, through: 1, by: 0.01)
                                Spacer()
                            }
                        }.padding([.top], -20)
                    }
                    VStack(alignment: .leading) {
                        Text("Color Two")
                            .lineLimit(nil)
                            .font(.title)
                        HStack {
                            VStack(alignment: .leading) {
                                Spacer()
                                Text("Red")
                                Spacer()
                                Text("Green")
                                Spacer()
                                Text("Blue")
                                Spacer()
                                Text("Opacity")
                                Spacer()
                            }.padding([.trailing], 15)
                            VStack {
                                Spacer()
                                Slider(value: $colorTwoR, from: 0, through: 1, by: 0.01)
                                Spacer()
                                Slider(value: $colorTwoG, from: 0, through: 1, by: 0.01)
                                Spacer()
                                Slider(value: $colorTwoB, from: 0, through: 1, by: 0.01)
                                Spacer()
                                Slider(value: $colorTwoA, from: 0, through: 1, by: 0.01)
                                Spacer()
                            }
                        }.padding([.top], -20)
                    }
                    Spacer()
                    Button(action: {
                        self.showModal.toggle()
                        if(!self.categoryName.isEmpty) {
                            self.store.create(name: self.categoryName,colorOneR: self.colorOneR, colorOneG: self.colorOneG, colorOneB: self.colorOneB, colorOneA: self.colorOneA, colorTwoR: self.colorTwoR, colorTwoG: self.colorTwoG, colorTwoB: self.colorTwoB, colorTwoA: self.colorTwoA)
                            self.categoryName = ""
                        }
                    }) {
                        Text("Save")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                    }
                }.padding()
            }
        }
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
    @State var showActionSheet = false
    @State var categoryIdDelete = UUID()
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Remove Category"),
            message: Text("Are you sure you want to delete the category and all of it's data?"),
            buttons: [
                .destructive(Text("Delete"), onTrigger: {
                    self.store.deleteById(id: self.categoryIdDelete)
                }),
                .cancel()
            ]
        )
    }
    
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
                            self.categoryIdDelete = self.category.id
                            self.showActionSheet.toggle()
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
                                        self.categoryIdDelete = self.categories[index + 1].id
                                        self.showActionSheet.toggle()
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
        }.actionSheet(isPresented: $showActionSheet, content: { self.actionSheet })
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
        .background(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: self.category.colorOneR, green: self.category.colorOneG, blue: self.category.colorOneB, opacity: self.category.colorOneA), Color(.sRGB, red: self.category.colorTwoR, green: self.category.colorTwoG, blue: self.category.colorTwoB, opacity: self.category.colorTwoA)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)), cornerRadius: 0)
        .cornerRadius(30)
        .shadow(radius: 5, y: 0)
    }
}

struct CategoryCellItemEmpty: View {
    @Binding var categoryName: String
    
    @Binding var colorOneR: Double
    @Binding var colorOneG: Double
    @Binding var colorOneB: Double
    @Binding var colorOneA: Double
    
    @Binding var colorTwoR: Double
    @Binding var colorTwoG: Double
    @Binding var colorTwoB: Double
    @Binding var colorTwoA: Double
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(categoryName)
                        .foregroundColor(.white)
                        .lineLimit(2)
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 30, height: 2)
                        .cornerRadius(1)
                }
                Spacer()
                Image(systemName: "chevron.right.circle.fill").foregroundColor(Color.white)
            }
        }
        .frame(width: (UIScreen.main.bounds.width / 2), height: (UIScreen.main.bounds.width / 2) - 60)
        .frame(maxHeight: 200)
        .font(.headline)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: colorOneR, green: colorOneG, blue: colorOneB, opacity: colorOneA), Color(.sRGB, red: colorTwoR, green: colorTwoG, blue: colorTwoB, opacity: colorTwoA)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)), cornerRadius: 0)
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
