//
//  Assign01.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/17.
//

import Foundation
import Combine

extension Practice {
    // assign()의 keyPath를 활용해서 객체의 프로퍼티에 접근하여 값 set
    func playAssign() {
        class MyClass {
            var didSetTexts = [String]()
            var anInt: Int = 0 {
                didSet {
                    print("\(oldValue) changed to \(anInt) ")
                }
            }
        }
        
        let myObject = MyClass()
        let myRange = (1...5)
        
        let _ = myRange.publisher
            .assign(to: \.anInt, on: myObject)
    }
}
