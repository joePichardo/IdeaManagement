//
//  ContentView.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/20/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var categories: [Category] = []
    var ballots: [Ballot] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.identified(by: \.id)) { category in
                    CategorySection(listTitle: category.name,
                                    ballots: self.ballots)
                }
            }.listStyle(.grouped)
            .navigationBarTitle(Text("Categories"))
        }
        
    }
}

struct CategorySection: View {
    var listTitle: String = ""
    var ballots: [Ballot] = []
    
    var body: some View {
        Section(header: Text(listTitle).font(.title)) {
            CategoryRow(ballots: ballots)
        }
    }
}

struct CategoryRow: View {
    var ballots: [Ballot] = []
    var body: some View {
        ForEach(ballots.identified(by: \.id)) { ballot in
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
        ContentView(categories: categoryTestData, ballots: ballotTestData)
    }
}
#endif
