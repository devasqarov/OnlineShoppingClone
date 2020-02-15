//
//  DetailProductImageVC.swift
//  OnlineShoppingClone
//
//  Created by user on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DetailProductImageVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var imageData : [UIImage] = []
    var indexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.addPanGesture)))
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.isPagingEnabled = true
        self.collectionView.scrollToItem(at: indexPath ?? IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .black
        setupCellView(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func setupCellView(cell: UICollectionViewCell, indexPath: IndexPath){
        
        let button = UIButton(frame: CGRect(x: self.collectionView.frame.width - 80, y: 20, width: 60, height: 60))
        button.setImage(#imageLiteral(resourceName: "closeThin"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)
        
        let image = UIImageView()
        cell.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: image.widthAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        image.backgroundColor = .white
        image.image = imageData[indexPath.row]
        image.contentMode = .scaleAspectFill
        image.tag = 1
        
        cell.addSubview(button)
    }
    
    @objc func addPanGesture(gesture: UIPanGestureRecognizer){
        
        let translation = gesture.translation(in: self.view)
        if gesture.state == .began{
            print("Began")
        }else if gesture.state == .changed {
            self.view.alpha = 1 - translation.y / self.view.frame.height
            self.view.transform = CGAffineTransform(translationX: 0, y: translation.y)
        } else if gesture.state == .ended {
            if self.view.alpha >= 0.8 {
                UIView.animate(withDuration: 0.2) {
                    self.view.transform = .identity
                    self.view.alpha = 1
                }
            }else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func closeBtnPressed(){
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.5
    }
    
}
