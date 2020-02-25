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
        CityTableDM(city: "Bahrain", code: "+2341"),
        CityTableDM(city: "Bangladesh", code: "+2341"),
        CityTableDM(city: "Barbados", code: "+2341"),
        CityTableDM(city: "Belarus", code: "+2341"),
        CityTableDM(city: "Belgium", code: "+2341"),
        CityTableDM(city: "Belize", code: "+2341"),
    ] 

    @IBOutlet weak var tableView: UITableView!
    
    var rigthBarBtn: UIBarButtonItem!
    var leftBarBtn: UIBarButtonItem!
    var searchController: UISearchController! 
    
    var selectedCity:String?
    var selectedCode:String?
    
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
        rigthBarBtn = UIBarButtonItem(title: "☌", style: .done, target: self, action: #selector(rightBtnPressed))
        navigationItem.rightBarButtonItem = rigthBarBtn
        leftBarBtn = UIBarButtonItem(title: "←", style: .done, target: self, action: #selector(leftBtnPressed))
        navigationItem.leftBarButtonItem = leftBarBtn
    }
    func removeNavBorder() {
        // removing navigationBar footer line
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar!.shadowImage = UIImage()
        navigationItem.title = "Select a country"
    }
    
    @objc func rightBtnPressed() {
        
        self.searchController = UISearchController(searchResultsController: CitySearchVC(nibName: "CitySearchVC", bundle: nil))
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.searchBar.isTranslucent = false
        self.searchController.searchBar.barTintColor = .red
        searchController.searchBar.searchTextField.backgroundColor = .white
            
        self.searchController.searchBar.placeholder = "Search country"
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Close"
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
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

//MARK: TableView Configurations
extension CityTableVC: UITableViewDelegate, UITableViewDataSource {
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //*** taking selected city name and country code ***//
        selectedCity = data[indexPath.row].city
        selectedCode = data[indexPath.row].code
        
        data[indexPath.row].isSelected = !data[indexPath.row].isSelected
        tableView.reloadData()
    }
    
    
    
}

//MARK: Searchbar Configurations
extension CityTableVC: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        setUpBarButton()
        self.searchController.searchBar.isHidden = true // ***********
        navigationItem.title = "Select a country"

    }
    
}
