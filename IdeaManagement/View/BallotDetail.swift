//
//  BallotDetail.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/22/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI

struct BallotDetail : View {
    
//    @ObjectBinding var store = BallotStore()
    
    var body: some View {
        Text("hi")
//        ScrollView {
//            ForEach(store.ballots.identified(by: \.id)) {
//                ballot in
//                NavigationLink(destination: Text(ballot.name)) {
//                    if ballot.id == self.store.ballots[0].id {
//                        HStack {
//                            Text("Add New List").foregroundColor(.primary)
//                            Image(systemName: "checkmark.seal.fill").foregroundColor(.green)
//                            Spacer()
//                            Image(systemName: "chevron.right.circle.fill")
//                        }
//                        .font(.system(size: 24, design: .rounded))
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(8)
//                            .shadow(radius: 2, y: 0)
//                        HStack {
//                            Text(ballot.name).foregroundColor(.primary)
//                            Image(systemName: "checkmark.seal.fill").foregroundColor(.green)
//                            Spacer()
//                            Image(systemName: "chevron.right.circle.fill")
//                        }
//                        .font(.system(size: 24, design: .rounded))
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(8)
//                            .shadow(radius: 2, y: 0)
//                    } else {
//                        HStack {
//                            Text(ballot.name).foregroundColor(.primary)
//                            Image(systemName: "checkmark.seal.fill").foregroundColor(.green)
//                            Spacer()
//                            Image(systemName: "chevron.right.circle.fill")
//                        }
//                        .font(.system(size: 24, design: .rounded))
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(8)
//                            .shadow(radius: 2, y: 0)
//                    }
//                }
//            }
//            .padding([.leading, .trailing], 15)
//                .accentColor(Color.pink)
//        }.navigationBarTitle(Text("Lists"))
//            .navigationBarItems(trailing: EditButton())
//            .listStyle(.grouped)
    }
    
    func addList() {
//        store.ballots.insert(List(context: <#T##NSManagedObjectContext#>), at: 0)
    }
    
    func delete(at offsets: IndexSet) {
//        if let first = offsets.first {
//            store.ballots.remove(at: first)
//        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        
//        // sort the indexes low to high
//        let reversedSource = source.sorted()
//
//        // then loop from the back to avoid reordering problems
//        for index in reversedSource.reversed() {
//            // for each item, remove it and insert it at the destination
//            store.ballots.insert(store.ballots.remove(at: index), at: destination)
//        }
    }
}

struct BallotCell: View {
    var ballot: String
    
    var body: some View {
        NavigationLink(destination: Text(ballot)) {
            ZStack {
                Circle()
                    .foregroundColor(Color.red)
                Text("100")
                    .foregroundColor(Color.white)
                    .font(.body)
                }.frame(width: 50.0)
            VStack(alignment: .leading) {
                Text(ballot)
                Text("10 Ideas")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}


#if DEBUG
struct BallotDetail_Previews : PreviewProvider {
    static var previews: some View {
        Text("hi")
//        NavigationView {
//            BallotDetail(store: BallotStore(ballots: ballotTestData))
//        }
    }
}
#endif
