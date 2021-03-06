//
//  WatchedProductsVC.swift
//  OnlineShoppingClone
//
//  Created by Rakhmatillo Topiboldiev on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//


import UIKit

class WatchedProductsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func initUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FavoriteWatchedTVC", bundle: nil), forCellReuseIdentifier: "favoriteTVC")
    }
    
}


//MARK: - TableView extension

extension WatchedProductsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 2
        }else if section == 1{
            return 3
        }else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteTVC", for: indexPath) as? FavoriteWatchedTVC else {return UITableViewCell()}
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if self.view.frame.height <= 700{
            return self.view.frame.height / 4.9
        }else {
            return self.view.frame.height / 6.5
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        hView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9803921569, alpha: 1)
        let titleLbl = UILabel(frame: CGRect(x: 10, y: hView.frame.height / 4, width: hView.frame.width - 20, height: 20))
        titleLbl.text = "Beverages/Drink"
        hView.addSubview(titleLbl)
        return hView
        
    }
    
    
}
