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
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var addToCartView: UIView!
    var isViewHidden: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
        
    }
    
    func initUI(){
        
        backView.layer.cornerRadius = 15
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        addToCartView.isHidden = isViewHidden
        addView.isHidden = !isViewHidden
    }
    
    @IBAction func addToCartBtnPressed(_ sender: UIButton) {
        isViewHidden = !isViewHidden
        addToCartView.isHidden = isViewHidden
        addView.isHidden = !isViewHidden
    }
    
}
