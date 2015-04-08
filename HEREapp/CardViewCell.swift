//
//  CardViewCell.swift
//  HEREapp
//
//  Created by Aaron Monick on 4/8/15.
//  Copyright (c) 2015 here. All rights reserved.
//

import UIKit

protocol CardCellDelegate {
    func didLikeButtonPressed(cell: CardViewCell)
}

class CardViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var addressLabel:UILabel!
    @IBOutlet weak var distanceLabel:UILabel!
    @IBOutlet weak var likeButton:UIButton!
    
    var isLiked:Bool = false  {
        didSet {
            if isLiked {
                likeButton.setImage(UIImage(named: "heartfull"), forState: .Normal)
            } else {
                likeButton.setImage(UIImage(named: "heart"), forState: .Normal)
            }
        }
    }
    
    var delegate:CardCellDelegate?
    
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
        delegate?.didLikeButtonPressed(self)
    }
}
