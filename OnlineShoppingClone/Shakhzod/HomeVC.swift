//
//  HomeVC.swift
//  OnlineShoppingClone
//
//  Created by Shakhzodbek on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!

    
    var menuBtn: UIBarButtonItem!
    var shoppingCartBtn: UIBarButtonItem!
    var searchController: UISearchController!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavCont()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController!.navigationBar.frame.height)
        self.navigationController?.navigationBar.layoutIfNeeded()
        
    }
    
    func setupNavCont(){
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor  = #colorLiteral(red: 0.04300250858, green: 0.5516898036, blue: 0.267576158, alpha: 1)
        
        showBarBtns()

       
        self.searchController = UISearchController(searchResultsController: Home_SearchVC(nibName: "Home_SearchVC", bundle: nil))
        self.searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchController.searchBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
        print(self.searchController.searchBar.frame.height)
        self.searchController.searchBar.layoutIfNeeded()
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.searchBar.isTranslucent = false
        searchController.searchBar.searchTextField.backgroundColor = .white
        self.searchController.searchBar.placeholder = "Search products"
        
    UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = .white
        
        //self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
    }
    
    @objc func menuBtnPressed(){
        print("menu pressed")
        self.sideMenuViewController!.presentLeftMenuViewController()
    }
    
    @objc func shoppingCartBtnPressed(){
        print("cart Btn pressed")
    }
    
    func hideBarBtns(){
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
    }
    
    func showBarBtns(){
        menuBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(menuBtnPressed))
        shoppingCartBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "shopping-cart"), style: .plain, target: self, action: #selector(shoppingCartBtnPressed))
        navigationItem.leftBarButtonItem = menuBtn
        navigationItem.rightBarButtonItem = shoppingCartBtn
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func setupViews(){
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "Home_CategoriesTVC", bundle: nil), forCellReuseIdentifier: "Home_CategoriesTVC")
        tableView.register(UINib(nibName: "Home_CarouselTVC", bundle: nil), forCellReuseIdentifier: "Home_CarouselTVC")
        
    }
    
    
}


//MARK: Search Controller Configuration
extension HomeVC: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        print("Update")
       hideBarBtns()
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        showBarBtns()
    }


}


//MARK: TableView Configuration
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    //UITableViewDataSourcePrefetching
    
    
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        print("for infinite scrolling")
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cardCell = tableView.dequeueReusableCell(withIdentifier: "Home_CarouselTVC", for: indexPath) as? Home_CarouselTVC else{
                return UITableViewCell()
            }
            cardCell.delegate = self
            return cardCell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Home_CategoriesTVC", for: indexPath) as? Home_CategoriesTVC else{return UITableViewCell()}
              
            return cell
        }
  
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return UIScreen.main.bounds.width/3*2+15
        }else{
            return CGFloat(self.view.frame.height/2.3)
        }
    }
    
    
}

//MARK: slideNum protocol
extension HomeVC: slideNum{
    func getSlideNum(num: Int) {
        let vc = Home_CarouselVC(nibName: "Home_CarouselVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
