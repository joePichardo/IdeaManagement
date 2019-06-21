//
//  Ballot.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/20/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI

struct Ballot : Identifiable {
    var id = UUID()
    var name: String
}

#if DEBUG
let ballotTestData = [
    Ballot(name: "App"),
    Ballot(name: "Travel"),
    Ballot(name: "Business"),
    Ballot(name: "Books"),
    Ballot(name: "Dinner"),
    Ballot(name: "Holiday")
]
#endif
