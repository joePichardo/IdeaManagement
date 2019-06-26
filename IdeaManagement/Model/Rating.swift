//
//  Rating.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/25/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI

struct Rating : Identifiable {
    var id = UUID()
    var name: String
}

#if DEBUG
let ratingTestData = [
    Rating(name: "Rating #1"),
    Rating(name: "Rating #2"),
    Rating(name: "Rating #3"),
    Rating(name: "Rating #4"),
    Rating(name: "Rating #5"),
    Rating(name: "Rating #6")
]
#endif
