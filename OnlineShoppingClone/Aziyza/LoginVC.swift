//
//  LoginVC.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, SelectedCitySend {
    
    func sendCity(text: String, code: String) {
        cityLabel.text = text
        codeTxtField.text = code

    }
    
    
    

    
    
    @IBOutlet weak var confirmMessage: UILabel!
    @IBOutlet weak var phoneTxtField: UITextField!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var codeTxtField: UITextField!
    
    var rigthBarBtn: UIBarButtonItem!
    var leftBarBtn: UIBarButtonItem!
        
    var cityname:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpBarButton()
        removeNavBorders()
        phoneTxtField.becomeFirstResponder()
        updateLabel()
    }
    
    func setUpBarButton() {
        rigthBarBtn = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(rightBtnPressed))
        navigationItem.rightBarButtonItem = rigthBarBtn
        leftBarBtn = UIBarButtonItem(title: "↓", style: .done, target: self, action: #selector(leftBtnPressed))
        navigationItem.leftBarButtonItem = leftBarBtn
    }
    
    func removeNavBorders() {
        // removing navigationBar footer line
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar!.shadowImage = UIImage()
    }
    
    @objc func rightBtnPressed() {
        
        if self.phoneTxtField.text == "" || self.codeTxtField.text == "" {
            let alert = UIAlertController(title: "", message: "Phone number and country code is required", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            
            let alert = UIAlertController(title: "", message: "Make sure it is your phone number", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
                let vc = ConfirmVC(nibName: "ConfirmVC", bundle: nil)
                vc.phoneNumber = "\(self.codeTxtField.text ?? "12") \(self.phoneTxtField.text ?? "1234")"
                self.navigationController?.pushViewController(vc, animated: true)
            }
            let noAction = UIAlertAction(title: "No", style: .cancel) { (_) in
                print("No pressed")
            }
            alert.addAction(yesAction)
            alert.addAction(noAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    @objc func leftBtnPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func chooseCityBtnPressed(_ sender: UIButton) {
        let vc = CityTableVC(nibName: "CityTableVC", bundle: nil)
        vc.delegate = self
        let navvc = UINavigationController(rootViewController: vc)
        navvc.modalPresentationStyle = .overFullScreen
        self.present(navvc, animated: true, completion: nil)
        
    }
    
}

extension LoginVC {
    // Language change extension
    
    func updateLabel() {
        confirmMessage.text = Lang.getString(for: .l_confirmMessage)
    }
}
