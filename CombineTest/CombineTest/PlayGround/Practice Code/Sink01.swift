//
//  Sink01.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/17.
//

import Foundation
import Combine

extension Practice {
    func sink01(_ completion: @escaping (String) -> Void) {
        // Convinience Publisher "Just"를 사용해서 Publish
        // publish한 값을 textLabel에 적용
        let publisher = Just("Hello")
        // subscriber
        let _ = publisher
            .sink(receiveCompletion: { completion in
                print("Publishing was \(completion)")
            }) { value in
                print(value)
                completion(value)
            }
    }
}
