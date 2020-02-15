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
    @IBOutlet weak var nameOfProductLbl: UILabel!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var addToCartView: UIView!
    @IBOutlet weak var countOfProductLbl: UILabel!
    @IBOutlet weak var pricePCLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    
    var count = 1
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
        pricePCLbl.text = "\(8000)"
        totalPriceLbl.text = pricePCLbl.text
        countOfProductLbl.text = "\(count)"
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        count += 1
        if count == 1{
            isViewHidden = !isViewHidden
            addToCartView.isHidden = isViewHidden
            addView.isHidden = !isViewHidden
        }
        countOfProductLbl.text = "\(count)"
        totalPriceLbl.text = "\(Int(pricePCLbl.text!)! * count)"
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        count -= 1
        if count <= 0{
            count = 1
            isViewHidden = !isViewHidden
            addToCartView.isHidden = isViewHidden
            addView.isHidden = !isViewHidden
        }
        countOfProductLbl.text = "\(count)"
        totalPriceLbl.text = "\(Int(pricePCLbl.text!)! * count)"
    }
    
    @IBAction func addToCartBtnPressed(_ sender: UIButton) {
        isViewHidden = !isViewHidden
        addToCartView.isHidden = isViewHidden
        addView.isHidden = !isViewHidden
    }
    
}
