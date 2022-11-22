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
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .print()
            .eraseToAnyPublisher()
    }
}
