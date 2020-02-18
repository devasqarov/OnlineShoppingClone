//
//  WelcomeCVCell.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class WelcomeCVCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateLabel()
    }

    func updateCell(data: WelcomeDM) {
        imgView.image = data.image
        titleLbl.text = data.title
        subtitleLbl.text = data.subtitle
        
    }
}


extension WelcomeCVCell {
    // Language change extension
    
    func updateLabel() {
        
    }
}
