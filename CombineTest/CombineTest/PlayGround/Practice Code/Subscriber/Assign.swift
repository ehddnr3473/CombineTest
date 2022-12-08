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
        class Student {
            var name: String
            var grade = 1 {
                didSet {
                    print("\(name)은 \(oldValue)학년에서 \(grade)학년이 되었습니다.")
                }
            }
            init(name: String) {
                self.name = name
            }
        }
        let yeolmok = Student(name: "yeolmok")
        
        let gradeRange = (2...4)
        
        gradeRange.publisher
            .assign(to: \.grade, on: yeolmok)
            .cancel()
    }
}
