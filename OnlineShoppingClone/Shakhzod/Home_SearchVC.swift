//
//  Home_SearchVC.swift
//  OnlineShoppingClone
//
//  Created by Shakhzodbek on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//



import UIKit

class Home_SearchVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tempDataSearch: [Home_Product] = [
        Home_Product(),
        Home_Product(),
        Home_Product(),
        Home_Product(),
        Home_Product()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "Home_SearchTVC", bundle: nil), forCellReuseIdentifier: "Home_SearchTVC")
    }



}


extension Home_SearchVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempDataSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Home_SearchTVC", for: indexPath) as? Home_SearchTVC else{
            return UITableViewCell()
        }
        
        cell.prodNameLbl.text = tempDataSearch[indexPath.row].name
        cell.prodPriceLbl.text = "\(tempDataSearch[indexPath.row].price)"
        cell.prodCostLbl.text = "\(tempDataSearch[indexPath.row].price)"
        cell.prodImg.image = tempDataSearch[indexPath.row].image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
