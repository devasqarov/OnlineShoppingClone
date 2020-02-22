//
//  Home_CarouselVC.swift
//  OnlineShoppingClone
//
//  Created by Shakhzodbek on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class Home_CarouselVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageCont: UIPageControl!
    
    var tempDataCards:[UIImage] = [#imageLiteral(resourceName: "card1"), #imageLiteral(resourceName: "card2"), #imageLiteral(resourceName: "card3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "Home_CarouselVC_CVC", bundle: nil), forCellWithReuseIdentifier: "Home_CarouselVC_CVC")
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension Home_CarouselVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempDataCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "Home_CarouselVC_CVC", for: indexPath) as? Home_CarouselVC_CVC else{
            return UICollectionViewCell()
        }
        item.cardImg.image = tempDataCards[indexPath.row]
        item.descTF.text = "Loremipu asdf adfa sdg a dsfasdf adsfa adf adfafLoremipu asdf adfa sdg a dsfasdf adsfa adf adfafLoremipu asdf adfa sdg a dsfasdf adsfa adf adfafLoremipu asdf adfa sdg a dsfasdf adsfa adf adfafLoremipu asdf adfa sdg a dsfasdf adsfa adf adfaf"
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            pageCont.currentPage = indexPath.item
    }
}
