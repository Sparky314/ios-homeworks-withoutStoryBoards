//
//  File.swift
//  Navigation
//
//  Created by Sergey on 28.03.2022.
//

import UIKit

class Post {
    var title: String
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    var isLiked: Bool = false
    
    init (title: String, author: String, description: String, image: String, likes: Int, views: Int) {
        self.title = title
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}
