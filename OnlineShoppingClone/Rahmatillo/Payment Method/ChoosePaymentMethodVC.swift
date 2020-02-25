//
//  ChoosePaymentMethodVC.swift
//  OnlineShoppingClone
//
//  Created by Rakhmatillo Topiboldiev on 2/24/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class ChoosePaymentMethodVC: UIViewController {
    
    struct DM {
        var img: UIImage
        var label: String
        var bool: Bool
    }
    @IBOutlet weak var tableView: UITableView!
    var isCellselected = false
    
    var data = [DM(img: #imageLiteral(resourceName: "cash"), label: "Cash", bool: false),DM(img: #imageLiteral(resourceName: "card"), label: "Card", bool: false)]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .groupTableViewBackground
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.register(UINib(nibName: DefaultKeys.TVC_PAYMENT_METHOD , bundle: nil), forCellReuseIdentifier: DefaultKeys.TVC_PAYMENT_METHOD)
    }
    
    
}

//MARK: - TableView extension
extension ChoosePaymentMethodVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DefaultKeys.TVC_PAYMENT_METHOD, for: indexPath) as! ChoosePaymentMethodTVC
        cell.cardLbl.text = data[indexPath.row].label
        cell.cardImgView.image = data[indexPath.row].img
        if data[indexPath.row].bool{
            if #available(iOS 13.0, *) {
                cell.checkImgView.image = UIImage(systemName: "checkmark")
            }
        }else{
            cell.checkImgView.image = .none
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0..<data.count where data[i].bool{
            data[i].bool = false
        }
        data[indexPath.row].bool = !data[indexPath.row].bool
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.frame.height / 12
    }
    
}
