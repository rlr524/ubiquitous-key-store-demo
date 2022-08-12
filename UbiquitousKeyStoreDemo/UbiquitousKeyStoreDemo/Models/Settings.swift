//
//  Setting.swift
//  UbiquitousKeyStoreDemo
//
//  Created by Rob Ranf on 8/12/22.
//

import Foundation

struct Settings: Codable {
    var firstName: String = ""
    var lastName: String = ""

    var fullName: String {
        return "\(firstName) \(lastName)".trimmingCharacters(in: .whitespaces)
    }
}
