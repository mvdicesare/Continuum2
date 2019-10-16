//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Michael Di Cesare on 10/15/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var postImageViewCell: UIImageView!
    @IBOutlet weak var postCaptionLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    
    
    var post: Post? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        postImageViewCell.image = post?.photo
        postCaptionLabel.text = post?.caption
        commentCountLabel.text = "\(post?.commentCount ?? 0)"
        
    }
    
}

