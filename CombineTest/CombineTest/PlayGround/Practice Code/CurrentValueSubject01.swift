//
//  CurrentValueSubject01.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/18.
//

import Foundation
import Combine

extension Practice {
    // publishTextField.text를 CurrentValueSubject의 initial value로 전달받음.
    func currentValueSubject01(initialValue: String) {
        let subject = CurrentValueSubject<(String), Never>(initialValue)
        
        let subscriber = subject
            .sink { value in
                print(value)
            }
        // subscriber에게 값을 송신
        subject.send("hello")
        
        // 변경할 때 새로운 element로서 publish됨.
        subject.value = "swift"
        
        // subject로 wrapped된 값
        print(subject.value)
        
        subscriber.cancel()
        
        // subscriber를 cancel하여 수신되지 않음.
        subject.send("canceled")
    }
}
