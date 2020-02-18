//
//  Lang.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/18/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import Foundation

class Lang {
    
    static func getString(for type:stringType) -> String {
        
        let lang = UserDefaults.standard.string(forKey: DefaultKeys.LANG_KEY)
        
        if lang == "uz" {
            
            return StrValue.getUzStr(forType: type)
            
        } else if lang == "en" {
            return StrValue.getEnStr(forType: type)
        } else {
            return StrValue.getRuStr(forType: type)
        }
    }
    
    enum stringType {
        case b_skip
        case l_confirmMessage
        
    }
    
    struct StrValue {
        static func getUzStr(forType: stringType) -> String {
            switch forType {
                case .b_skip: return "O'tkazib yuborish"
                case .l_confirmMessage: return "Iltimos davlat kodi va telefon raqamingizni kiriting"
            }
        }
        
        static func getEnStr(forType: stringType) -> String {
            switch forType {
                case .b_skip: return "Skip"
                case .l_confirmMessage: return "Please confirm your country code and enter phone number"
            }
        }
        
        static func getRuStr(forType: stringType) -> String {
            switch forType {
                case .b_skip: return "Skip"
                case .l_confirmMessage: return "Please confirm your country code and enter phone number"
            }
        }
    }
    
}
