//
//  Post.swift
//  Continuum
//
//  Created by Michael Di Cesare on 10/15/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit



class Post {
    var photoData: Data?
    let timestamp: Date
    let caption: String
    var comments: [Comment]
    var commentCount: Int
    var photo: UIImage? {
        get{
            guard let photoData = photoData else { return nil }
            return UIImage(data: photoData)
        }
        set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    init(photo: UIImage, timestamp: Date = Date(), caption: String, commentCount: Int = 0, comments: [Comment] = []) {
        self.timestamp = timestamp
        self.caption = caption
        self.comments = comments
        self.commentCount = commentCount
        self.photo = photo
        
    }
}
