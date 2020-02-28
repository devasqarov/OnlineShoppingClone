//
//  SideMenuVC.swift
//  OnlineShoppingClone
//
//  Created by Mukhammadyunus on 2/15/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let myCellNamesArray = [["Change Supplier", "All Categories"],["Call-center", "F.A.Q", "Public Offer", "Language"], ["Sign-in"]]
    
    let myCellImagesArray = [[UIImage(named: "pin"), UIImage(named: "list")], [UIImage(named: "phone"), UIImage(named: "question"), UIImage(named: "document"), UIImage(named: "language")], [UIImage(named: "login")]]
    
    let myCellImageColors: [[UIColor]] = [[#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)],[#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)], [#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SideMenuItemTVC", bundle: nil), forCellReuseIdentifier: "SideMenuItemTVC")
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("SIDEMENU DID APPEAR")
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

}


extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCellNamesArray[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuItemTVC", for: indexPath) as! SideMenuItemTVC
        cell.mainLabel.text = myCellNamesArray[indexPath.section][indexPath.row]
        cell.myImage.image = myCellImagesArray[indexPath.section][indexPath.row]
        cell.myImage.tintColor = myCellImageColors[indexPath.section][indexPath.row]
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            let vc = AllCategoriesVC()
           
        } else if indexPath.section == 0 && indexPath.row == 0 {
            let vc = ChangeBranchVC()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 25
        } else {
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 45))
        headerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return headerView
        
    }
    
}
