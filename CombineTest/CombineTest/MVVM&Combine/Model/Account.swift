//
//  Model.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/16.
//

import Foundation

struct Account {
    var id = "ehddnr3473"
    var password = "1234"
    var name = "김동욱"
    var address: String?
    var phone: String?
    
    mutating func modify(_ id: String, _ password: String, _ name: String) {
        self.id = id
        self.password = password
        self.name = name
    }
}
