//
//  MyViewModel.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/12/11.
//

import Foundation

class MyViewModel {
    var myText = "" {
        didSet {
            print("\(oldValue)에서 \(myText)로 변경되었습니다.")
        }
    }
}
