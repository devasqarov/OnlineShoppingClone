//
//  Home_CategoriesTVC.swift
//  OnlineShoppingClone
//
//  Created by Shakhzodbek on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

struct Home_Product{
    var name: String = "Potato, weight"
    var price: Int = 9999
    var currecy: String = "UZS"
    var discount: String = "10%"
    var howmany: Int = 0
    var image: UIImage = #imageLiteral(resourceName: "card2")
}

class Home_CategoriesTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var tempDataProducts: [Home_Product] = [
        Home_Product(),
        Home_Product(),
        Home_Product(),
        Home_Product(),
        Home_Product()
    ]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "Home_ProductCVC", bundle: nil), forCellWithReuseIdentifier: "Home_ProductCVC")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension Home_CategoriesTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let product = collectionView.dequeueReusableCell(withReuseIdentifier: "Home_ProductCVC", for: indexPath) as? Home_ProductCVC else{
            return UICollectionViewCell()
        }
        
        product.productImg.image = tempDataProducts[indexPath.row].image
        product.productName.text = tempDataProducts[indexPath.row].name
        product.productPriceLbl.text = "\(tempDataProducts[indexPath.row].price)"
        product.productCurrencyLbl.text = tempDataProducts[indexPath.row].currecy
        
        
        return product
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height)
    }
    
}
