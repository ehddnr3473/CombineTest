//
//  ObservableObject.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/19.
//

import Foundation
import Combine

extension Practice {
    func playObservableObject() {
        class Contact: ObservableObject {
            @Published var name: String
            @Published var age: Int
            
            init(name: String, age: Int) {
                self.name = name
                self.age = age
            }
            
            func haveBirthday() -> Int {
                age += 1
                return age
            }
        }
        
        let donguk = Contact(name: "Donguk Kim", age: 27)
        let subscriber = donguk.objectWillChange
            .sink { _ in
                print("\(donguk.age) will change")
        }
        print(donguk.haveBirthday())
    }
}
