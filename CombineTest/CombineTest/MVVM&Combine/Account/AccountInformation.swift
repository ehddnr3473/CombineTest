//
//  AccountInformation.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/16.
//

import Foundation
import Combine

/// Account View Model Object
final class AccountInformation {
    private var account = Account()
    
    var id: String {
        account.id
    }
    
    var password: String {
        account.password
    }
    
    var name: String {
        account.name
    }
    
    func modify(id: String, password: String, name: String) {
        account.modify(id, password, name)
    }
}
