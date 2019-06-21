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
}

#if DEBUG
let categoryTestData = [
    Category(name: "App"),
    Category(name: "Travel"),
    Category(name: "Business"),
    Category(name: "Books"),
    Category(name: "Dinner"),
    Category(name: "Holiday")
]
#endif
