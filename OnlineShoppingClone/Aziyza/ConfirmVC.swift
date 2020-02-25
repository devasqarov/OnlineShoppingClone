//
//  ConfirmVC.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/15/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class ConfirmVC: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var placeholderLabel: UILabel!
    
    var phoneNumber:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneLabel.text = phoneNumber
    }
    
    @IBAction func txtfieldDragInside(_ sender: Any) {
        self.placeholderLabel.isHidden = true
    }
    @IBAction func txtfieldEdittingChanged(_ sender: Any) {
        if textField.text?.count == 0 {
            self.placeholderLabel.isHidden = false
        } else {
            self.placeholderLabel.isHidden = true
        }
        if textField.text?.count == 5 {
           let vc = HomeVC(nibName: "HomeVC", bundle: nil)
            let navvc = UINavigationController(rootViewController: vc)
            navvc.modalPresentationStyle = .overFullScreen
           self.present(navvc, animated: true, completion: nil)
        }
    }
}
