//
//  ChangeBranchVC.swift
//  OnlineShoppingClone
//
//  Created by Mukhammadyunus on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//



import UIKit

class ChangeBranchVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedSet = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedSet = UserDefaults.standard.integer(forKey: DefaultKeys.SELECTED_SET_DEF_KEY)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ChangeBranchTVC", bundle: nil), forCellWithReuseIdentifier: "ChangeBranchTVC")
    }
    
    
    func selectView() -> UIImageView{
        let selectedSet = UIImageView(frame: CGRect(x: view.frame.width/2-70, y: view.frame.width/2-80, width: 30, height: 30))
        selectedSet.clipsToBounds = true
        selectedSet.contentMode = .scaleAspectFill
        selectedSet.image = UIImage(named: "correct")
        selectedSet.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        selectedSet.tag = 10
        return selectedSet
    }
    
}


extension ChangeBranchVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2-30, height: self.view.frame.width/2-30)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChangeBranchTVC", for: indexPath) as! ChangeBranchTVC
        cell.setCorners(radius: (cell.frame.width-20)/2)
        
        if self.selectedSet == indexPath.item {
            cell.selectedImageView.isHidden = false
        } else {
            cell.selectedImageView.isHidden = true
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedSet != indexPath.item {
            selectedSet = indexPath.item
            UserDefaults.standard.set(selectedSet, forKey: DefaultKeys.SELECTED_SET_DEF_KEY)
        }
        
        collectionView.reloadData()
    }
    
}
