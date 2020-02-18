//
//  AllCategoriesVC.swift
//  OnlineShoppingClone
//
//  Created by Mukhammadyunus on 2/17/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

struct CellData {
    var isOpen = false
    var title = ""
    var items: [String] = []
    var image: UIImage?
}

class AllCategoriesVC: UIViewController {
    var bool = false
    var data = [
        CellData(isOpen: false, title: "Vegetables and fruits", items: ["All", "Vegetables", "Fruits", "Greens", "Dried fruits/nuts"], image: #imageLiteral(resourceName: "broccoli")),
        CellData(isOpen: false, title: "Water/beverages", items: ["All", "Juices", "Kvass/mors", "Water", "Carbonated drinks", "Cold drinks"], image: #imageLiteral(resourceName: "water")),
        CellData(isOpen: false, title: "Eggs/milk and dairy products", items: ["All", "Butter", "Cheese", "Suluguni", "Brynza", "Eggs"], image: #imageLiteral(resourceName: "milk")),
        CellData(isOpen: false, title: "Meat and meat products", items: ["All", "Beef", "Lamb", "Poultry meat", "Rabbit meat", "Fish", "Fish products", "Sausage products", "Sausage", "Deli meat"], image: #imageLiteral(resourceName: "meat")),
        CellData(isOpen: false, title: "Detergents", items: ["All", "Washing powders", "Cleansers and detergents", "Sponges/Rags/Wipes"], image: #imageLiteral(resourceName: "bleach")),
        CellData(isOpen: false, title: "Grocery", items: ["All", "Cereals in the package", "Flour", "Sugar/Navad/Salt", "Noodle products", "Vegetable oil", "Honey/Confiture/Jam/Condensed milk", "Margarine", "Breakfast cereal", "Fast food products", "Ketchups/Sauces/Mayonnaise", "Seasonings/Spices/Mixes for baking", "Sunflower seeds/Chips/Kurt/Popcorn"], image: #imageLiteral(resourceName: "supermarket")),
        CellData(isOpen: false, title: "Tea/Coffee", items: ["All", "Black tea", "Green tea", "Coffee/Cocoa/Cream"], image: #imageLiteral(resourceName: "food")),
        CellData(isOpen: false, title: "Bread and bakery products", items: ["All", "Fresh bakery products", "Baguettes/Loaves/Flatbreads", "Rye bread/bread with bran", "Dried/Crackers", "Lavash"], image: #imageLiteral(resourceName: "bread")),
        CellData(isOpen: false, title: "Cakes and sweets", items: ["All", "Cakes and pastry", "Cooky/waffles/gingerbread", "Diabetic products", "Other sweets", "Chocolate products"], image: #imageLiteral(resourceName: "cake"))
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        bool = false
        sideMenuViewController?.panGestureEnabled = false
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        bool = true
        sideMenuViewController?.setContentViewController(UINavigationController(rootViewController: HomeVC()), animated: true)
        sideMenuViewController?.presentLeftMenuViewController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        sideMenuViewController?.panGestureEnabled = true
    }
    
}


extension AllCategoriesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isOpen {
            return data[section].items.count + 1
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        18
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vview = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 18))
        vview.backgroundColor = .clear
        return vview
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if indexPath.row == 0 {
            cell.textLabel!.text = data[indexPath.section].title
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
            cell.imageView?.image = data[indexPath.section].image
            cell.imageView?.tintColor = .black
        } else {
            cell.textLabel!.text = data[indexPath.section].items[indexPath.row-1]
            if indexPath.row - 1 == 0 {
                cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            }
            cell.imageView?.image = #imageLiteral(resourceName: "bread")
            cell.imageView?.tintColor = .clear
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            data[indexPath.section].isOpen = !data[indexPath.section].isOpen
            tableView.reloadSections(IndexSet(integer: indexPath.section), with: .none)
        } else {
            
        }
    }
    
    
    
    
}
