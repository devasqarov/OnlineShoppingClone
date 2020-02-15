//
//  Home_ProductCVC.swift
//  OnlineShoppingClone
//
//  Created by Shakhzodbek on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class Home_ProductCVC: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productCurrencyLbl: UILabel!
    @IBOutlet weak var productName: UILabel!
    var productAddBtn: UIButton!
    var numberOfProductsToBuy: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        productAddBtn = UIButton()
        containerView.addSubview(productAddBtn)
        productAddBtn.setImage(#imageLiteral(resourceName: "circelAddGreen"), for: .normal)
        productAddBtn.addTarget(self, action: #selector(addBtnPressed(_:)), for: .touchUpInside)
        
        productAddBtn?.translatesAutoresizingMaskIntoConstraints = false
        productAddBtn?.heightAnchor.constraint(equalToConstant: CGFloat(35)).isActive = true
        productAddBtn.widthAnchor.constraint(equalToConstant: CGFloat(35)).isActive = true
        productAddBtn.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10).isActive = true
        productAddBtn.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -10).isActive = true
        
        
    }
    
    
    @objc func addBtnPressed(_ sender: UIButton) {
        addProdCounter(superView: self.containerView)
    }
    
    public func addProdCounter(superView: UIView){
        let counterView = UIView()
        counterView.layer.cornerRadius = 10
        counterView.backgroundColor = .white
        self.containerView.insertSubview(counterView, aboveSubview: productAddBtn)
        
        counterView.translatesAutoresizingMaskIntoConstraints = false
        counterView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        counterView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        counterView.topAnchor.constraint(equalTo: superView.topAnchor, constant: 10).isActive = true
        counterView.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -10).isActive = true
        
        let numberLbl = UILabel()
        numberLbl.tintColor = .black
        numberLbl.text = "\(numberOfProductsToBuy)"
        
        let removeBtn = UIButton()
        removeBtn.imageView?.image = #imageLiteral(resourceName: "remove")
        removeBtn.imageView?.tintColor = #colorLiteral(red: 0.04300250858, green: 0.5516898036, blue: 0.267576158, alpha: 1)
        removeBtn.addTarget(self, action: #selector(removeBtnPressed), for: .touchUpInside)
        
        let addBtn = UIButton()
        addBtn.imageView?.image = #imageLiteral(resourceName: "add")
        addBtn.imageView?.tintColor = #colorLiteral(red: 0.04300250858, green: 0.5516898036, blue: 0.267576158, alpha: 1)
        addBtn.addTarget(self, action: #selector(addPressed), for: .touchUpInside)
        
        counterView.addSubview(numberLbl)
        counterView.addSubview(removeBtn)
        counterView.addSubview(addBtn)
        
        numberLbl.translatesAutoresizingMaskIntoConstraints = false
        numberLbl.centerXAnchor.constraint(equalTo: counterView.centerXAnchor).isActive = true
        numberLbl.centerYAnchor.constraint(equalTo: counterView.centerYAnchor).isActive = true
        numberLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        numberLbl.widthAnchor.constraint(equalToConstant: 30).isActive = true

        
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.leftAnchor.constraint(equalTo: numberLbl.rightAnchor, constant: 10).isActive = true
        addBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true

        
        removeBtn.translatesAutoresizingMaskIntoConstraints = false
        removeBtn.rightAnchor.constraint(equalTo: numberLbl.leftAnchor, constant: -10).isActive = true
        removeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        removeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
    }

    @objc func removeBtnPressed(){
        numberOfProductsToBuy -= 1
        print(numberOfProductsToBuy)
    }
    
    @objc func addPressed(num: UILabel){
        numberOfProductsToBuy += 1
        print(numberOfProductsToBuy)
    }

}

class customView: UIView {

// Only override draw() if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
override func draw(_ rect: CGRect) {
    // Drawing code
    // Get Height and Width
    let layerHeight = layer.frame.height
    let layerWidth = layer.frame.width
    // Create Path
    let bezierPath = UIBezierPath()
    //  Points
    let pointA = CGPoint(x: 0, y: 0)
    let pointB = CGPoint(x: layerWidth, y: 0)
    let pointC = CGPoint(x: layerWidth, y: layerHeight)
    let pointD = CGPoint(x: 0, y: layerHeight*2/3)
    // Draw the path
    bezierPath.move(to: pointA)
    bezierPath.addLine(to: pointB)
    bezierPath.addLine(to: pointC)
    bezierPath.addLine(to: pointD)
    bezierPath.close()
    // Mask to Path
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = bezierPath.cgPath
    layer.mask = shapeLayer
}
}
