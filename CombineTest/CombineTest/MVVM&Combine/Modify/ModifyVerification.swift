//
//  ModifyVerification.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/22.
//

import Foundation
import Combine

/// Modify View Model Object
final class ModifyVerification {
    @Published var password = ""
    @Published var passwordConfirm = ""
    
    lazy var isMatched: AnyPublisher<Bool, Never> = Publishers.CombineLatest($password, $passwordConfirm)
        .map { password, passwordConfirm in
            if password == "" || passwordConfirm == "" {
                return false
            } else if  password == passwordConfirm {
                return true
            } else {
                return false
            }
        }
        // For debugging
//        .print()
        .eraseToAnyPublisher()
}
