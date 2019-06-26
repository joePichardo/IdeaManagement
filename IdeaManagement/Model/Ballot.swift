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
    var ideas: [Idea]
}

#if DEBUG
let ballotTestData = [
    Ballot(name: "List #1", ideas: ideaTestData),
    Ballot(name: "List #2", ideas: ideaTestData),
    Ballot(name: "List #3", ideas: ideaTestData),
    Ballot(name: "List #4", ideas: ideaTestData),
    Ballot(name: "List #5", ideas: ideaTestData),
    Ballot(name: "List #6", ideas: ideaTestData)
]
#endif
