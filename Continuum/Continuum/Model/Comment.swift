//
//  Comment.swift
//  Continuum
//
//  Created by Michael Di Cesare on 10/15/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import Foundation
import CloudKit



class Comment {
    let text: String
    let timestamp: Date
    weak var post: Post?
    //let recordID: CKRecord.ID
    
    init(text: String, timestamp: Date = Date(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
}

extension Comment: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        return text.contains(searchTerm)
    }
}
