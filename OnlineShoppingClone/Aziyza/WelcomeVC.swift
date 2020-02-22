//
//  WelcomeVC.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit


class WelcomeVC: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var rigthBarBtn: UIBarButtonItem!
    var data:[WelcomeDM] = [
        WelcomeDM(image: #imageLiteral(resourceName: "welcomeFirst"), title: "A large assortment", subtitle: "Large range with your favourite networks"),
        WelcomeDM(image: #imageLiteral(resourceName: "welcomeSecond"), title: "Save time", subtitle: "Now you do not need to visit hypermarkets, we will do it for you"),
        WelcomeDM(image: #imageLiteral(resourceName: "welcomeThird"), title: "Fast delivery", subtitle: "Delivery at a convenient time for you")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel), name: notificationName, object: nil)
        removeNavBorders()
        setUpCollectionView()
        setUpBarButton()
        updateLabel()
        
    
    }
    
    func setUpBarButton() {
        rigthBarBtn = UIBarButtonItem(title: "English", style: .done, target: self, action: #selector(rightBtnPressed))
        navigationItem.rightBarButtonItem = rigthBarBtn
    }
    
    @objc func rightBtnPressed() {
        let vc = GeneraltableVC(nibName: "GeneraltableVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func removeNavBorders() {
        // removing navigationBar footer line
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar!.shadowImage = UIImage()
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "WelcomeCVCell", bundle: nil), forCellWithReuseIdentifier: "WelcomeCVCell")
        collectionView.isPagingEnabled = true
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        
        let vc = UINavigationController(rootViewController: LoginVC(nibName: "LoginVC", bundle: nil))
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
                
    }
    

}
extension WelcomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WelcomeCVCell", for: indexPath) as? WelcomeCVCell else {return UICollectionViewCell()}
        cell.updateCell(data: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            self.view.viewWithTag(1)?.backgroundColor = .black
            self.view.viewWithTag(10)?.backgroundColor = .black
            self.view.viewWithTag(2)?.backgroundColor = .white
            self.view.viewWithTag(20)?.backgroundColor = .white
            self.view.viewWithTag(30)?.backgroundColor = .white
            self.view.viewWithTag(3)?.backgroundColor = .white

        } else if indexPath.row == 1 {
            self.view.viewWithTag(2)?.backgroundColor = .black
            self.view.viewWithTag(20)?.backgroundColor = .black
            self.view.viewWithTag(1)?.backgroundColor = .white
            self.view.viewWithTag(3)?.backgroundColor = .white
            self.view.viewWithTag(10)?.backgroundColor = .white
            self.view.viewWithTag(30)?.backgroundColor = .white

        } else if indexPath.row == 2 {
            self.view.viewWithTag(3)?.backgroundColor = .black
            self.view.viewWithTag(30)?.backgroundColor = .black
            self.view.viewWithTag(10)?.backgroundColor = .white
            self.view.viewWithTag(20)?.backgroundColor = .white
            self.view.viewWithTag(1)?.backgroundColor = .white
            self.view.viewWithTag(2)?.backgroundColor = .white

        }

        if indexPath.row == data.count-1 {
            nextBtn.setTitle("Login", for: .normal)
        }
        else {
            nextBtn.setTitle("Skip", for: .normal)
        }
    }
    
}

extension WelcomeVC{
    
    // Language change of strings
    @objc func updateLabel() {
        nextBtn.setTitle(Lang.getString(for: .b_skip), for: .normal)
    }
}
