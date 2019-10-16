//
//  PostController.swift
//  Continuum
//
//  Created by Michael Di Cesare on 10/15/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit


class PostController {
    
   static let shared = PostController()
    
    var posts: [Post] = []
    
    func addComment(text: String, post: Post, completion: @escaping (Comment?) -> Void) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Post?) -> Void)  {
        let post = Post(photo: image, caption: caption)
        self.posts.append(post)
    }
    
    
}
