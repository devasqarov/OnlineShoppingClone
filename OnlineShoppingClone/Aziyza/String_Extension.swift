//
//  String_Extension.swift
//  OnlineShoppingClone
//
//  Created by Mac on 2/22/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import Foundation

extension String {
    func validatePhoneNumber(phone number: String) -> String {
        let part1 = number.prefix(2)
        let part4 = number.suffix(2)
        let part2n = number.dropLast(4)
        let part2 = part2n.dropFirst(2)
        let part3n = number.dropLast(2)
        let part3 = part3n.dropFirst(5)
        let validNumber = "\(part1) \(part2) \(part3) \(part4)"
        return validNumber
    }
}
