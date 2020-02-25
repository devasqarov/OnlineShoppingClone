//
//  GeneraltableVC.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/15/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

let notificationName = Notification.Name("LangNotificationObserverID")

class GeneraltableVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data:[Any] = ["English", "O'zbekcha", "Russian"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel), name: notificationName, object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        // removing navigationBar footer line
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar!.shadowImage = UIImage()
        navigationItem.title = "Language"
        
    }

}

//MARK: - TableView Methods
extension GeneraltableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = data[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if data[indexPath.row] as? String == "English" {
            UserDefaults.standard.set("en", forKey: DefaultKeys.LANG_KEY)
            
            NotificationCenter.default.post(name: notificationName, object: nil)
            
            print(data[indexPath.row])
        } else if data[indexPath.row] as? String == "O'zbekcha" {
            UserDefaults.standard.set("uz", forKey: DefaultKeys.LANG_KEY)
            print(data[indexPath.row])
        } else {
            UserDefaults.standard.set("ru", forKey: DefaultKeys.LANG_KEY)
            print(data[indexPath.row])
        }
        
        navigationController?.popViewController(animated: true)
    }
        
}

extension GeneraltableVC {
    // Language change extension
    
    @objc func updateLabel() {
        
    }
}
