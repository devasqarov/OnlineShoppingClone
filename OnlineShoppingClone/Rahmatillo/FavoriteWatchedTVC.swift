//
//  FavoriteWatchedTVC.swift
//  OnlineShoppingClone
//
//  Created by Rakhmatillo Topiboldiev on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit
protocol DidStarSelectedProtocol {
    func didStarSelected()
}
class FavoriteWatchedTVC: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameOfProductLbl: UILabel!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var addToCartView: UIView!
    @IBOutlet weak var countOfProductLbl: UILabel!
    @IBOutlet weak var pricePCLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    @IBOutlet weak var starBtn: UIButton!
    
    var count = 1
    var isViewHidden: Bool = false
    
    var starSelectDelegate : DidStarSelectedProtocol?
    
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
    
//    func updateCell(with data: SomeDM){
//        if data.isFavorite{
//            starBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
//        }else{
//            starBtn.setImage(UIImage(systemName: "star"), for: .normal)
//        }
//    }
    
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
    
    @IBAction func starPressed(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            if sender.currentImage == UIImage(systemName: "star.fill"){
                sender.setImage(UIImage(systemName: "star"), for: .normal)
            }else{
                sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
            }
        } else {
            
        }
        
        starSelectDelegate?.didStarSelected()
    }
}
