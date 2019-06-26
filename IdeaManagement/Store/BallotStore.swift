//
//  BallotStore.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/25/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI
import Combine

class BallotStore: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    var ballots: [Ballot] {
        didSet {
            didChange.send(())
        }
    }
    
    init(ballots: [Ballot] = []) {
        self.ballots = ballots
    }
}
