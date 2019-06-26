//
//  CategoryStore.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/22/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI
import Combine

class CategoryStore: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    var categories: [Category] {
        didSet {
            didChange.send(())
        }
    }
    
    init(categories: [Category] = []) {
        self.categories = categories
    }
}
