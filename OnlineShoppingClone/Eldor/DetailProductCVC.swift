//
//  DetailProductCVC.swift
//  OnlineShoppingClone
//
//  Created by user on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class DetailProductCVC: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateView(image: UIImage){
        productImage.image = image
    }

}
