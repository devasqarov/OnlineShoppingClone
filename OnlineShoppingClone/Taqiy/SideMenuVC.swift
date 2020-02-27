//
//  SideMenuVC.swift
//  OnlineShoppingClone
//
//  Created by Mukhammadyunus on 2/15/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

protocol SideMenuDelegate {
    func changeSupplier()
    func gotoAllCategories()
    func gotoMyWallet()
    func gotoMyOrders()
    func gotoAddressBook()
    func gotoCardList()
    func gotoFavoriteProducts()
    func gotoWatchedProducts()
    func gotoFAQ()
    func gotoPublicOffer()
    func gotoLanguage()
    func gotoSignIn()
}


class SideMenuVC: UIViewController, MenuAnimationProtocol {
    
    func gestureTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBOutlet weak var tableView: UITableView!
    var delegate: SideMenuDelegate?
    
//    let myCellNamesArray = [["Change Supplier", "All Categories"],["Call-center", "F.A.Q", "Public Offer", "Language"], ["Sign-in"]]

    let myCellArrayAfterLogin = [["Change Supplier", "All Categories"], ["My Wallet"], ["My orders", "The address book", "Card list", "Favorite Products", "Watched products"],["Call-center", "F.A.Q", "Public Offer", "Language"], ["Sign-in"]]
    
    
    
//    let myCellImagesArray = [[UIImage(named: "pin"), UIImage(named: "list")], [UIImage(named: "phone"), UIImage(named: "question"), UIImage(named: "document"), UIImage(named: "language")], [UIImage(named: "login")]]

    let myCellImagesArrayAfterLogin = [[UIImage(named: "pin"), UIImage(named: "list")], [UIImage(named: "coin")], [UIImage(named: "order"), UIImage(named: "addressBook"), UIImage(named: "card"), UIImage(named: "favorite"), UIImage(named: "watched")], [UIImage(named: "phone"), UIImage(named: "question"), UIImage(named: "document"), UIImage(named: "language")], [UIImage(named: "login")]]
    
    
//    let myCellImageColors: [[UIColor]] = [[#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)], ,[#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)], [#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)]]
    
    let myCellImageColorsAfterLogin: [[UIColor]] = [[#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)], [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)], [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)],[#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)], [#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)]]
    
    
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
    
    override func viewDidDisappear(_ animated: Bool) { navigationController?.navigationBar.isHidden = false
    }

}



//MARK: - Extensions
extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCellArrayAfterLogin[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuItemTVC", for: indexPath) as! SideMenuItemTVC
        cell.mainLabel.text = myCellArrayAfterLogin[indexPath.section][indexPath.row]
        cell.myImage.image = myCellImagesArrayAfterLogin[indexPath.section][indexPath.row]
        cell.myImage.tintColor = myCellImageColorsAfterLogin[indexPath.section][indexPath.row]
        return cell
    }
    
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        switch indexPath {
        case IndexPath(row: 0, section: 0):
            delegate?.changeSupplier()
        case IndexPath(row: 1, section: 0):
            delegate?.gotoAllCategories()
        case IndexPath(row: 0, section: 1):
            delegate?.gotoMyWallet()
        case IndexPath(row: 0, section: 2):
            delegate?.gotoMyOrders()
        case IndexPath(row: 1, section: 2):
            delegate?.gotoAddressBook()
        case IndexPath(row: 2, section: 2):
            delegate?.gotoCardList()
        case IndexPath(row: 3, section: 2):
            delegate?.gotoFavoriteProducts()
        case IndexPath(row: 4, section: 2):
            delegate?.gotoWatchedProducts()
        case IndexPath(row: 0, section: 3):
            //Call center
            print("CALL CENTER PRESSED SIDEMENUVC 117 - ROW")
        case IndexPath(row: 1, section: 3):
            delegate?.gotoFAQ()
        case IndexPath(row: 2, section: 3):
            delegate?.gotoPublicOffer()
        case IndexPath(row: 3, section: 3):
            delegate?.gotoLanguage()
        default:
            print("CELL NOT FOUND SIDEMENU 125 - ROW")
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
        headerView.backgroundColor = #colorLiteral(red: 0.9685191512, green: 0.9686883092, blue: 0.9685210586, alpha: 1)
        return headerView
        
    }
    
}
