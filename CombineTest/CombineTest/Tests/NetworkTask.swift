//
//  NetworkTask.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/12/14.
//

import Foundation

class NetworkTask {
    func fetch(with url: URL, completion: @escaping (Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            completion(data, error)
        }.resume()
    }
}
