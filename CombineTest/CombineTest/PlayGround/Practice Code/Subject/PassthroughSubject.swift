//
//  PassthroughSubject.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/19.
//

import Foundation
import Combine

extension Practice {
    // PassthroughSubject는 초기값을 가지지 않음.
    func playPassthroughSubject() {
        let subject = PassthroughSubject<String, Never>()
        
        let subscriber = subject
            .sink { value in
                print(value)
            }
        
        subject.send("Hello")
        subject.send("Good")
        
        
        // completion signal을 보낸 후에, 후속 호출은 아무런 영향이 없음.
        subject.send(completion: .finished)
        subject.send("Hi")
    }
}
