//
//  ChooseDeliveryTimeVC.swift
//  OnlineShoppingClone
//
//  Created by Rakhmatillo Topiboldiev on 2/23/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class ChooseDeliveryTimeVC: UIViewController {
    struct TimeDM {
        var time : String
        var isAviable: Bool
        var isSelected: Bool
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
       @IBOutlet weak var nextBtn: UIButton!
    
    var tableViewdata : [TimeDM] = [TimeDM(time:"09:00 - 10:00", isAviable: true, isSelected: false),TimeDM(time: "10:00 - 11:00", isAviable: true, isSelected: false) , TimeDM(time: "11:00 - 12:00", isAviable: true, isSelected: false) , TimeDM(time: "12:00 - 13:00", isAviable: true, isSelected: false), TimeDM(time: "13:00 - 14:00", isAviable: true, isSelected: false) , TimeDM(time: "14:00 - 15:00", isAviable: true, isSelected: false), TimeDM(time: "15:00 - 16:00", isAviable: true, isSelected: false), TimeDM(time: "16:00 - 17:00", isAviable: true, isSelected: false), TimeDM(time: "17:00 - 18:00", isAviable: true, isSelected: false), TimeDM(time: "18:00 - 19:00", isAviable: true, isSelected: false), TimeDM(time: "19:00 - 20:00", isAviable: true, isSelected: false), TimeDM(time: "20:00 - 21:00", isAviable: true, isSelected: false), TimeDM(time: "21:00 - 22:00", isAviable: true, isSelected: false), TimeDM(time: "22:00 - 23:00", isAviable: true, isSelected: false)]
    var collectionViewdata = [[]]
 
    var itemNum = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    //MARK: - Setup UI
    func setUpUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.register(UINib(nibName: DefaultKeys.TVC_DELIVERY_TIME, bundle: nil), forCellReuseIdentifier: DefaultKeys.TVC_DELIVERY_TIME)
        
        updateTimeAvialability()
        
        collectionView.register(UINib(nibName: DefaultKeys.CVC_DELIVERY_TIME , bundle: nil), forCellWithReuseIdentifier: DefaultKeys.CVC_DELIVERY_TIME)
        
        let todayDay = getToday(addDay: 0)[0]
        let todayDate = getToday(addDay: 0)[1]
        
        let tomorrowDay = getToday(addDay: 1)[0]
        let tomorrowDate = getToday(addDay: 1)[1]
        
        let afterTomorrowDay = getToday(addDay: 2)[0]
        let afterTomorrowDate = getToday(addDay: 2)[1]
        
        collectionViewdata = [["",""],["\(todayDay)", "\(todayDate)"], ["\(tomorrowDay)", "\(tomorrowDate)"],["\(afterTomorrowDay)", "\(afterTomorrowDate)"],["",""]]
        nextBtn.backgroundColor = .lightGray
    }
    
    
    @IBAction func nextbtnPressed(_ sender: UIButton) {
        let vc = ChoosePaymentMethodVC(nibName: DefaultKeys.VC_CHOOSE_DELIVERY_TIME , bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Tableview extension
extension ChooseDeliveryTimeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultKeys.TVC_DELIVERY_TIME, for: indexPath) as? ChooseDeliveryTimeTVC else {return UITableViewCell()}
        
        cell.timeLbl.text = tableViewdata[indexPath.row].time
        if tableViewdata[indexPath.row].isAviable{
            cell.aviableLbl.text = "Aviable"
            cell.aviableLbl.textColor = .systemGreen
            
        }else{
            cell.aviableLbl.text = "Unaviable"
            cell.aviableLbl.textColor = .lightGray
            cell.selectionStyle = .none
        }
        if tableViewdata[indexPath.row].isSelected{
            cell.isAviableView.isHidden = false
        }else{
            cell.isAviableView.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableViewdata[indexPath.row].isAviable{
            for i in 0..<tableViewdata.count{
                tableViewdata[i].isSelected = false
            }
            tableViewdata[indexPath.row].isSelected = true
            nextBtn.backgroundColor = .systemGreen
            tableView.reloadData()
        }
    }
    
}



//MARK: - Collection extension
extension ChooseDeliveryTimeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultKeys.CVC_DELIVERY_TIME, for: indexPath) as? ChooseDeliveryTimeCVC else {
            return UICollectionViewCell()}
        cell.dayLbl.text = collectionViewdata[indexPath.item][0] as? String
        cell.dateLbl.text = collectionViewdata[indexPath.item][1] as? String
        
        if indexPath.item == 1{
            cell.dayLbl.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            cell.dateLbl.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    
    //MARK: - Time avialability function
    func updateTimeAvialability(){
        let df = DateFormatter()
        df.dateFormat = "H"
        
        let currentTime = df.string(from: Date())
        if itemNum == 1{//if itemNum = 1 it means today, then it should check aviable time
            if let currentTime = Int(currentTime){
                
                let prefix = abs(9 - (currentTime + 1))//current + 1 is one hour after from now
                for i in 0...prefix{
                    tableViewdata[i].isAviable = false
                }
                
                
            }
            
        }else{//not today, tomorrow, after tomorrow
            for i in 0..<tableViewdata.count{
                tableViewdata[i].isAviable = true
            }
            
        }
        for i in 0..<tableViewdata.count{
            tableViewdata[i].isSelected = false
        }
        
        
    }
    
    
    //MARK: - Paging, Scrolling collectonview cells
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if let scrollView = scrollView as? UICollectionView {
            
            
            // Simulate "Page" Function
            let pageWidth: Float = Float(self.collectionView.frame.width/3)
            let currentOffset: Float = Float(scrollView.contentOffset.x)
            let targetOffset: Float = Float(targetContentOffset.pointee.x)
            var newTargetOffset: Float = 0
            if targetOffset > currentOffset {
                newTargetOffset = ceilf(currentOffset / pageWidth) * pageWidth
            }
            else {
                newTargetOffset = floorf(currentOffset / pageWidth) * pageWidth
            }
            if newTargetOffset < 0 {
                newTargetOffset = 0
            }
            else if (newTargetOffset > Float(scrollView.contentSize.width)){
                newTargetOffset = Float(Float(scrollView.contentSize.width))
            }
            
            targetContentOffset.pointee.x = CGFloat(currentOffset)
            scrollView.setContentOffset(CGPoint(x: CGFloat(newTargetOffset), y: scrollView.contentOffset.y), animated: true)
            
            
            let index = Int((newTargetOffset / pageWidth) + 1)
            itemNum = index
            
            updateTimeAvialability()
            tableView.reloadData()
            
            changeLabelColor()
            
        }        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        scrollToNextCell(indexPath: indexPath)
    }
    
    //MARK: - Scroll to next cell
    func scrollToNextCell(indexPath: IndexPath){
        
        let cell = collectionView.cellForItem(at: indexPath)
        //get cell size
        let cellSize = CGSize(width: cell!.frame.width, height: cell!.frame.height)
        
        //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset
        
        //scroll to next cell
        if indexPath.item > itemNum{
            collectionView.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: self.view.frame.width, height: cellSize.height), animated: true)
            itemNum = indexPath.item
            changeLabelColor()
            
        }
        if indexPath.item < itemNum{
            collectionView.scrollRectToVisible(CGRect(x: contentOffset.x - cellSize.width, y: contentOffset.y, width: self.view.frame.width, height: cellSize.height), animated: true)
            itemNum = indexPath.item
            changeLabelColor()
        }
        
       
        updateTimeAvialability()
        tableView.reloadData()
        
    }
    
    //MARK: - Change current day Label color
    
    func changeLabelColor(){
        for i in 0...collectionViewdata.count-1 {
            if let coll = collectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? ChooseDeliveryTimeCVC {
                if i == itemNum {
                    coll.dayLbl.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
                    coll.dateLbl.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
                } else {
                    coll.dayLbl.textColor = .black
                    coll.dateLbl.textColor = .black
                }
            }
            
        }
    }
    //MARK: - get Today's Date
    func getToday(addDay: Int = 0) -> [String]{
        var todayDateStr = ""
        var todayDayStr = ""
        
        let df = DateFormatter()
        let now = Calendar.current.dateComponents(in: .current, from: Date())
        
        let today = DateComponents(year: now.year, month: now.month, day: now.day! + addDay)
        let dateToday = Calendar.current.date(from: today)!
        
        df.dateFormat = "dd MMMM"
        todayDateStr = df.string(from: dateToday)
        df.dateFormat = "EEEE"
        todayDayStr = df.string(from: dateToday)
        
      
        return [todayDayStr, todayDateStr]
        
    }
    
    
}
