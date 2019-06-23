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
                Button(action: addCategory) {
                    Text("Add Category")
                }
                ForEach(store.categories.identified(by: \.id)) { category in
                    CategorySection(listTitle: category.name,
                                    ballots: category.ballots)
                }
            }.listStyle(.grouped)
            .navigationBarTitle(Text("Categories"))
        }
    }
    
    func addCategory() {
        
    }
}

struct CategorySection: View {
    var listTitle: String = ""
    var ballots: [Ballot] = []
    
    var body: some View {
        Section(header: Text(listTitle).font(.title)) {
            ForEach(ballots.identified(by: \.id)) { ballot in
                NavigationButton(destination: BallotDetail(ballot: ballot)) {
                    CategoryRow(ballot: ballot)
                }
            }
        }
    }
}

struct CategoryRow: View {
    var ballot = Ballot(name: "", ideas: [])
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(Color.red)
                Text("100")
                    .foregroundColor(Color.white)
                    .font(.body)
            }.frame(width: 50.0)
            VStack(alignment: .leading) {
                Text(ballot.name)
                Text("10 Ideas")
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
