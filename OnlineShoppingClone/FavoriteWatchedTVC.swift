//
//  FavoriteWatchedTVC.swift
//  OnlineShoppingClone
//
//  Created by Rakhmatillo Topiboldiev on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class FavoriteWatchedTVC: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 15
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }

    
}
