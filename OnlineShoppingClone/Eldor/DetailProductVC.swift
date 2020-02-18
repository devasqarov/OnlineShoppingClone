//
//  DetailProductVC.swift
//  OnlineShoppingClone
//
//  Created by user on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class DetailProductVC: UIViewController {

    @IBOutlet weak var imageCollectionView : UICollectionView!
    @IBOutlet weak var similarCollectionView: UICollectionView!
    @IBOutlet weak var saleLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var oldPriceLbl: UILabel!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var plusMinusview: UIView!
    @IBOutlet weak var addToCardBtn: UIButton!
    @IBOutlet weak var productCountLbl: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    var imageData: [UIImage] = [#imageLiteral(resourceName: "product3"), #imageLiteral(resourceName: "product1"), #imageLiteral(resourceName: "product2")]
    var similarProductData: [String] = []
    let identifierDetailPCVC = "DetailProductCVC"
    let imageVCTransion = CustomTransionAnimation()
    var productCount : Int = 0 {
        didSet{
            if self.productCount <= 0 {
                self.showAddToCard(bool: true)
                self.productCount = 0
            }else {
                self.showAddToCard(bool: false)
                productCountLbl.text = "\(self.productCount)"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        configureCV()
        priceLbl.attributedText = setPriceLblAttr(price: "13 990", count: 1)
        
    }
    
    func setupView(){
        saleLbl.layer.cornerRadius = 10
        saleLbl.transform = CGAffineTransform(rotationAngle: -.pi / 4)
        
        oldPriceLbl.attributedText = "4500 UZS for 1 pc".strikeThrough()
        
        pageController.numberOfPages = imageData.count
        pageController.currentPage = 0
        
        
    }
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
    
        if sender.tag == 10 {
            self.productCount += 1
        }else {
            self.productCount -= 1
        }
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
        productCount += 1
        
    }
    
    func configureCV(){
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(UINib(nibName: identifierDetailPCVC, bundle: nil), forCellWithReuseIdentifier: identifierDetailPCVC)
    }
    
    func showAddToCard(bool: Bool){
        if bool {
            addToCardBtn.isHidden = false
            plusMinusview.isHidden = true
        }else{
            addToCardBtn.isHidden = true
            plusMinusview.isHidden = false
        }
    }
    
    func setPriceLblAttr(price: String, count : Int)->NSMutableAttributedString{
        let attr = NSMutableAttributedString(string: price, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.systemGreen])
        attr.append(NSAttributedString(string: " UZS for ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .light), NSAttributedString.Key.foregroundColor:UIColor.darkGray]))
        attr.append(NSAttributedString(string: "\(count)", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor:UIColor.black]))
         attr.append(NSAttributedString(string: " pc", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .light), NSAttributedString.Key.foregroundColor:UIColor.darkGray]))
        
        return attr
    }
    
}


extension DetailProductVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierDetailPCVC, for: indexPath) as? DetailProductCVC else {return UICollectionViewCell()}
        cell.updateView(image: imageData[indexPath.row])        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageController.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let vc = DetailProductImageVC(collectionViewLayout: layout)
        vc.modalPresentationStyle = .overFullScreen
        vc.transitioningDelegate = self
        vc.imageData = imageData
        vc.indexPath = indexPath
        guard let cell = collectionView.cellForItem(at: indexPath) as? DetailProductCVC else {return}
        imageVCTransion.fromView = cell.productImage
        present(vc, animated: true, completion: nil)
    }
    
}


extension DetailProductVC: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        imageVCTransion.close = false
        return imageVCTransion
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        imageVCTransion.close = true
        return imageVCTransion
    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
