//
//  CityTableVC.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/15/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

protocol SelectedCitySend {
    func sendCity(text: String, code: String)
}

class CityTableVC: UIViewController {
    
    var delegate: SelectedCitySend?
    
    var data:[CityTableDM] = [
        CityTableDM(city: "United States Virgin Islands", code: "+998"),
        CityTableDM(city: "Germany", code: "+1302"),
        CityTableDM(city: "Ukrain", code: "+546"),
        CityTableDM(city: "Norway", code: "+1234"),
        CityTableDM(city: "Switzerland", code: "+9082")
    ]

    @IBOutlet weak var tableView: UITableView!
    
    var rigthBarBtn: UIBarButtonItem!
    var leftBarBtn: UIBarButtonItem!
    
    var selectedCity:String?
    var selectedCode:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBarButton()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CityTableCell", bundle: nil), forCellReuseIdentifier: "CityTableCell")
        tableView.tableFooterView = UIView()
        
        // removing navigationBar footer line
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar!.shadowImage = UIImage()
        navigationItem.title = "Select a country"
        
    }
    
    func setUpBarButton() {
        rigthBarBtn = UIBarButtonItem(title: "☌", style: .done, target: self, action: #selector(rightBtnPressed))
        navigationItem.rightBarButtonItem = rigthBarBtn
        leftBarBtn = UIBarButtonItem(title: "←", style: .done, target: self, action: #selector(leftBtnPressed))
        navigationItem.leftBarButtonItem = leftBarBtn
    }
    
    @objc func rightBtnPressed() {
        print("Search pressed")
    }
    
    @objc func leftBtnPressed() {
        if selectedCity == nil && selectedCode == nil {
            delegate?.sendCity(text: "Uzbekistan" , code: "+998")
        } else {
            delegate?.sendCity(text: selectedCity! , code: selectedCode!)
        }
        
        self.dismiss(animated: true, completion: nil)
       }
    
}

extension CityTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableCell", for: indexPath) as? CityTableCell else {return UITableViewCell()}
        cell.cityLabel.text = data[indexPath.row].city
        cell.codeLabel.text = data[indexPath.row].code
        cell.accessoryType = data[indexPath.row].isSelected ? .checkmark : .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //*** taking selected city name and country code ***//
        selectedCity = data[indexPath.row].city
        selectedCode = data[indexPath.row].code
        
        data[indexPath.row].isSelected = !data[indexPath.row].isSelected
        tableView.reloadData()
    }
    
    
    
}
