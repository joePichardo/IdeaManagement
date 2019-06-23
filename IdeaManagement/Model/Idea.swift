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
}

#if DEBUG
let ideaTestData = [
    Idea(name: "App"),
    Idea(name: "Travel"),
    Idea(name: "Business"),
    Idea(name: "Books"),
    Idea(name: "Dinner"),
    Idea(name: "Holiday")
]
#endif
