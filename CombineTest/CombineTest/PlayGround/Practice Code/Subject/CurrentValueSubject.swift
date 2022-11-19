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
    func playCurrentValueSubject(initialValue: String) {
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
        
        // Void
        let voidSubject = CurrentValueSubject<Void, Never>(())
        
        let _ = voidSubject
            .sink { value in
                print("voidSubject: \(value)")
            }
        
        // subscriber에게 void 값을 송신
        // Available when Output is ().
        // 이벤트가 발생했음을 알리고 이벤트 자체를 전송할 필요가 없는 경우 Void 입력 및 출력을 사용.
        voidSubject.send()
        print(voidSubject.value)
    }
}
