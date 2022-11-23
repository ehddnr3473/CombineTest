//
//  Extensions.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/22.
//

import Foundation
import UIKit
import Combine


extension UISearchTextField {
    // PlayGround/debounce test에서 사용할 Publisher property
    // debounce를 Publish 할 때 적용하는 것과 sink(subscribe) 할 때 적용하는 것은 조금 다름.
    // DebounceViewController의 configure()에서 확인.
    var textFieldPublisher: AnyPublisher<String,Never> {
        NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UISearchTextField }
            .map { $0.text ?? "" }
            .filter { $0.count > 0 }
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .print()
            .eraseToAnyPublisher()
    }
}

extension UITextField {
    // UITextField에 text가 바뀌었을때 Notification을 publish하는 Publisher property
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}

extension UIButton {
    // 할당(subscribe)받기 위한 property
    // Bool 값에 따라 버튼의 상태 변화
    var isValid: Bool {
        get {
            backgroundColor == .cyan
        }
        set {
            backgroundColor = newValue ? .cyan : .systemGray
            isEnabled = newValue
        }
    }
}

