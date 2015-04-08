//
//  Card.swift
//  HEREapp
//
//  Created by Aaron Monick on 4/8/15.
//  Copyright (c) 2015 here. All rights reserved.
//

import Foundation
import UIKit

class Card {
    var id = ""
    var name = ""
    var address = ""
    var featuredImage: UIImage?
    var distance = ""
    var isLiked = false
    
    init(id: String, name: String, address: String, featuredImage: UIImage!, distance: String, isLiked: Bool) {
        self.id = id
        self.name = name
        self.address = address
        self.featuredImage = featuredImage
        self.distance = distance
        self.isLiked = isLiked
    }
}
