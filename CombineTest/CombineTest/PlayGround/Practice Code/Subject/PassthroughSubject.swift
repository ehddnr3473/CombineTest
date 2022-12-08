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
    
    enum MyError: Error {
        case failureSignal
    }
    func playPassthroughSubject() {
        let subject = PassthroughSubject<String, MyError>()
        
        let subscriber = subject.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(MyError.failureSignal):
                print("fail")
            case .finished:
                print("finished")
            }
        }) { receivedValue in
            print(receivedValue)
        }
        
        subject.send("Hello")
        subject.send("Good")
        
        subject.send(completion: .failure(MyError.failureSignal))
        // completion signal을 보낸 후에, 후속 호출은 아무런 영향이 없음.
        subject.send(completion: .finished)
        subject.send("Hi")
    }
}
