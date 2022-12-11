//
//  CombineWithNotification.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/12/09.
//

import UIKit
import Combine

// NotificationCenter & Combine Operator Test
final class CombineWithNotification: UIViewController {

    private var myTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "텍스트를 입력해주세요."
        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    private let myViewModel = MyViewModel()
    private var mySubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myTextField)
        
        setUpNotificationWithMap()
    }
    
    override func viewDidLayoutSubviews() {
        myTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myTextField.center = view.center
    }
    
    private func setUpNotificationWithMap() {
        let myPublisher = NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: myTextField)
            .map { notification in
                (notification.object as! UITextField).text!
            }
        
        mySubscriber = myPublisher
//            .map { notification in
//                (notification.object as! UITextField).text!
//            }
            .filter { $0.count > 5 }
            .assign(to: \.myText, on: myViewModel)
    }
}
