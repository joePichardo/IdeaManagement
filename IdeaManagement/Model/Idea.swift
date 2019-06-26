//
//  Idea.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/22/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI

struct Idea : Identifiable {
    var id = UUID()
    var name: String
    var ratings: [Rating]
}

#if DEBUG
let ideaTestData = [
    Idea(name: "Idea #1", ratings: ratingTestData),
    Idea(name: "Idea #2", ratings: ratingTestData),
    Idea(name: "Idea #3", ratings: ratingTestData),
    Idea(name: "Idea #4", ratings: ratingTestData),
    Idea(name: "Idea #5", ratings: ratingTestData),
    Idea(name: "Idea #6", ratings: ratingTestData)
]
#endif
