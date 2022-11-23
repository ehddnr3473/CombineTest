//
//  Extensions.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/22.
//

import Foundation
import UIKit
import Combine

extension UITextField {
    // UITextField에 text가 바뀌었을때 Notification을 publish하는 Publisher
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
