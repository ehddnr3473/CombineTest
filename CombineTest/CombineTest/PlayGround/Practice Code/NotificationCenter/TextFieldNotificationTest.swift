//
//  TextFieldNotificationTest.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/12/09.
//

import UIKit
import Combine

// NotificationCenter & Combine Operator Test
final class TextFieldNotificationTest: UIViewController {

    private var myTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "텍스트를 입력해주세요."
        textField.layer.borderWidth = 1
        
        return textField
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myTextField)
        
        setUpNotification()
    }
    
    private var subscriptions = [AnyCancellable]()
    
    override func viewDidLayoutSubviews() {
        myTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myTextField.center = view.center
    }
    
    private func setUpNotification() {
        let publisher = NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: myTextField)
        
        publisher.sink { receivedNotification in
            print(receivedNotification)
        }
        .store(in: &subscriptions)
    }
}
