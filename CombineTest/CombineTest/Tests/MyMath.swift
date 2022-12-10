//
//  MyMathTest.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/12/11.
//

import Foundation

class MyMath {
    
    func add(_ x: Int, _ y: Int) -> Int {
        x + y
    }
    
    func subtract(_ x: Int, _ y: Int) -> Int {
        x - y
    }
    
    func multiply(_ x: Int, _ y: Int) -> Int {
        x * y
    }
    
    func devide(_ x: Int, _ y: Int) -> Int? {
        if x % y == 0 {
            return x / y
        } else {
            return nil
        }
    }
}
