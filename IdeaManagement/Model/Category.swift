//
//  Category.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/20/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI

struct Category : Identifiable {
    var id = UUID()
    var name: String
    var ballots: [Ballot]
}

#if DEBUG
let categoryTestData = [
    Category(name: "App", ballots: ballotTestData),
    Category(name: "Travel", ballots: ballotTestData),
    Category(name: "Business", ballots: ballotTestData),
    Category(name: "Books", ballots: ballotTestData),
    Category(name: "Dinner", ballots: ballotTestData),
    Category(name: "Holiday", ballots: ballotTestData),
]
#endif
