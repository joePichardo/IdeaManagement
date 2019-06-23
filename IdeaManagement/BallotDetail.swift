//
//  BallotDetail.swift
//  IdeaManagement
//
//  Created by Joe Pichardo on 6/22/19.
//  Copyright © 2019 Joe Pichardo. All rights reserved.
//

import SwiftUI

struct BallotDetail : View {
    let ballot: Ballot
    
    var body: some View {
        Text(ballot.name)
    }
    
    func addIdea() {
        
    }
}


#if DEBUG
struct BallotDetail_Previews : PreviewProvider {
    static var previews: some View {
        BallotDetail(ballot: ballotTestData[0])
    }
}
#endif
