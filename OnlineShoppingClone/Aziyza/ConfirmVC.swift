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
    
    var phoneNumber:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        phoneLabel.text = phoneNumber
    }
}
