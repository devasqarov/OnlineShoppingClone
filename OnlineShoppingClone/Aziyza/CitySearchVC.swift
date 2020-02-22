//
//  CitySearchVC.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/19/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class CitySearchVC: UIViewController {
    
    var dataDictionary = [String: [CityTableDM]]()
    var dataSectionTitles = [String]()
    var data:[CityTableDM] = [
        CityTableDM(city: "United States Virgin Islands", code: "+998"),
        CityTableDM(city: "Germany", code: "+1302"),
        CityTableDM(city: "Ukrain", code: "+546"),
        CityTableDM(city: "Norway", code: "+1234"),
        CityTableDM(city: "Switzerland", code: "+9082"),
        CityTableDM(city: "Afghanistan", code: "+2341"),
        CityTableDM(city: "Algeria", code: "+2341"),
        CityTableDM(city: "Albania", code: "+2341"),
        CityTableDM(city: "Angola", code: "+2341"),
        CityTableDM(city: "Argentina", code: "+2341"),
        CityTableDM(city: "Australia", code: "+2341"),
    ]
    
    var rigthBarBtn: UIBarButtonItem!
    var leftBarBtn: UIBarButtonItem!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBarButton()
        removeNavBorder()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CityTableCell", bundle: nil), forCellReuseIdentifier: "CityTableCell")
        tableView.tableFooterView = UIView()
        
        alphabeticalSorting() 
    }
    
    func alphabeticalSorting() {
        for cityData in data {
            let cityKey = String(cityData.city.prefix(1))
            if var cityValues = dataDictionary[cityKey] {
                cityValues.append(cityData)
                dataDictionary[cityKey] = cityValues
            } else {
                dataDictionary[cityKey] = [cityData]
            }
        }
        dataSectionTitles = [String](dataDictionary.keys)
        dataSectionTitles = dataSectionTitles.sorted(by: { $0 < $1 })
    }
    
    func setUpBarButton() {
        rigthBarBtn = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(rightBtnPressed))
        navigationItem.rightBarButtonItem = rigthBarBtn
        
    }
    func removeNavBorder() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
//        navigationBar!.shadowImage = UIImage()
    }
    
    @objc func rightBtnPressed() {
         self.dismiss(animated: true, completion: nil)

    }
    

}

extension CitySearchVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cityKey = dataSectionTitles[section]
        if let cityValues = dataDictionary[cityKey] {
            return cityValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableCell", for: indexPath) as? CityTableCell else {return UITableViewCell()}
        let cityKey = dataSectionTitles[indexPath.section]
        if let cityValues = dataDictionary[cityKey] {
            cell.cityLabel.text = cityValues[indexPath.row].city
            cell.codeLabel.text = cityValues[indexPath.row].code
        }
        cell.accessoryType = data[indexPath.row].isSelected ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataSectionTitles
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
