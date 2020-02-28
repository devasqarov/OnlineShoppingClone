//
//  ChooseDeliveryTimeTVC.swift
//  OnlineShoppingClone
//
//  Created by Rakhmatillo Topiboldiev on 2/23/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class ChooseDeliveryTimeTVC: UITableViewCell {

    @IBOutlet weak var isAviableView: UIView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var aviableLbl: UILabel!
    
    var isaviable: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        isAviableView.isHidden = true
    }
  
   
    
}
