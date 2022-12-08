//
//  Publish.swift
//  CombineTest
//
//  Created by 김동욱 on 2022/11/21.
//

import Foundation
import Combine

extension Practice {
    func publishAnIntArary() {
        var myCancellableSet = [AnyCancellable]()
        let myIntArrayPublisher: Publishers.Sequence<[Int], Never> = [1, 2, 3].publisher
        
        myIntArrayPublisher.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print(completion)
            case .failure(let error):
                print(error)
            }
        }) { value in
            print(value)
        }
        .store(in: &myCancellableSet)
        
        print(myCancellableSet)
    }
    
    func publishWithNotificationCenter() {
        let myNotification = Notification.Name("Yeolmok")
        
        let myDefaultPublisher: NotificationCenter.Publisher = NotificationCenter.default.publisher(for: myNotification)
        
        var mySubscription: AnyCancellable?
        var mySubscriptionSet = [AnyCancellable]()
        
        mySubscription = myDefaultPublisher.sink { receivedNotification in
            print(receivedNotification)
        }
        
        // inout operator "&"
        mySubscription?.store(in: &mySubscriptionSet)
        
        NotificationCenter.default.post(Notification(name: myNotification))
        NotificationCenter.default.post(Notification(name: myNotification))
        NotificationCenter.default.post(Notification(name: myNotification))
        
        mySubscription?.cancel()
    }
    
    // KVO - Key Value Observing
    func changeId(to newId: String) {
        class MyAccount {
            var id = "ehddnr3473" {
                didSet {
                    print("\(oldValue) was changed to \(id)")
                }
            }
        }
        
        let myAccount = MyAccount()
        
        var myFriendSubscription: AnyCancellable = [newId].publisher
            .assign(to: \.id, on: myAccount)
    }
}
