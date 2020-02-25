//
//  ChooseDeliveryTimeVC.swift
//  OnlineShoppingClone
//
//  Created by Rakhmatillo Topiboldiev on 2/23/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class ChooseDeliveryTimeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tableViewdata = [1,2,3,4,5,6,7]
    var collectionViewdata = [["",""],["today", "25 February"], ["tomorrow", "26 February"],["after tomorrow", "27 February"],["",""]]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    

    func setUpUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.register(UINib(nibName: DefaultKeys.TVC_DELIVERY_TIME, bundle: nil), forCellReuseIdentifier: DefaultKeys.TVC_DELIVERY_TIME)
        collectionView.register(UINib(nibName: DefaultKeys.CVC_DELIVERY_TIME , bundle: nil), forCellWithReuseIdentifier: DefaultKeys.CVC_DELIVERY_TIME)
    }

    
    @IBAction func nextbtnPressed(_ sender: UIButton) {
        let vc = ChoosePaymentMethodVC(nibName: DefaultKeys.VC_CHOOSE_DELIVERY_TIME , bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ChooseDeliveryTimeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultKeys.TVC_DELIVERY_TIME, for: indexPath) as? ChooseDeliveryTimeTVC else {return UITableViewCell()}
        
        return cell
    }
    
    
}

//MARK: - Collection extension
extension ChooseDeliveryTimeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultKeys.CVC_DELIVERY_TIME, for: indexPath) as? ChooseDeliveryTimeCVC else {
            return UICollectionViewCell()}
        cell.dayLbl.text = collectionViewdata[indexPath.item][0]
        cell.dateLbl.text = collectionViewdata[indexPath.item][1]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
      }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }
     
    
}
