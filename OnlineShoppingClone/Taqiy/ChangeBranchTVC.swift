//
//  ChangeBranchTVC.swift
//  OnlineShoppingClone
//
//  Created by Mukhammadyunus on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class ChangeBranchTVC: UICollectionViewCell {

    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var containerV: UIView!
    @IBOutlet weak var selectedImageView: UIImageView!
    var isSetSelected = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedImageView.isHidden = !isSetSelected
        selectedImageView.layer.shadowOpacity = 0
    }
    
    
    func setCorners(radius: CGFloat){
        imageIV.layer.cornerRadius = radius
        containerV.layer.cornerRadius = radius
        containerV.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerV.layer.shadowOpacity = 0.7
    }
    
    func updateCell() {
        
    }

}
