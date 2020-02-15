//
//  Home_SearchTVC.swift
//  OnlineShoppingClone
//
//  Created by Shakhzodbek on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class Home_SearchTVC: UITableViewCell {

    @IBOutlet weak var prodImg: UIImageView!
    @IBOutlet weak var prodNameLbl: UILabel!
    @IBOutlet weak var prodPriceLbl: UILabel!
    @IBOutlet weak var prodCostLbl: UILabel!
    @IBOutlet weak var prodCurrencyLbl: UILabel!
    @IBOutlet weak var addProdBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }
    
}
