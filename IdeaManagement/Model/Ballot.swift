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
    Ballot(name: "App", ideas: ideaTestData),
    Ballot(name: "Travel", ideas: ideaTestData),
    Ballot(name: "Business", ideas: ideaTestData),
    Ballot(name: "Books", ideas: ideaTestData),
    Ballot(name: "Dinner", ideas: ideaTestData),
    Ballot(name: "Holiday", ideas: ideaTestData)
]
#endif
