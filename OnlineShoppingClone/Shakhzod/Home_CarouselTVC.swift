//
//  Home_CarouselTVC.swift
//  OnlineShoppingClone
//
//  Created by Shakhzodbek on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//
protocol slideNum {
    func getSlideNum(num: Int)
}

import UIKit

class Home_CarouselTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageCont: UIPageControl!
    
    var tempDataCards:[UIImage] = [#imageLiteral(resourceName: "card1"), #imageLiteral(resourceName: "card2"), #imageLiteral(resourceName: "card3")]
    var isUserPaging: Bool = false
 
    var delegate: slideNum?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "Home_CarouselCVC", bundle: nil), forCellWithReuseIdentifier: "Home_CarouselCVC")
        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slide), userInfo: nil, repeats: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

    @objc func slide()
    {
        if !isUserPaging{
            perform(#selector(slideCard), with: nil, afterDelay: 2.0)
        }
    }
    
    @objc func slideCard(){
        if pageCont.currentPage == tempDataCards.count - 1{
            pageCont.currentPage = 0
            collectionView.scrollToItem(at: IndexPath(item: pageCont.currentPage, section: 0), at: .centeredHorizontally, animated: true)
        }else{
            collectionView.scrollToItem(at: IndexPath(item: pageCont.currentPage+1, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
}

//MARK: Collection View Configuration
extension Home_CarouselTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempDataCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let card = collectionView.dequeueReusableCell(withReuseIdentifier: "Home_CarouselCVC", for: indexPath) as? Home_CarouselCVC else{
            return UICollectionViewCell()
        }
        card.carouselImg.image = tempDataCards[indexPath.row]
        
        return card
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            pageCont.currentPage = indexPath.item
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isUserPaging = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isUserPaging = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.getSlideNum(num: indexPath.row)
    }
}
