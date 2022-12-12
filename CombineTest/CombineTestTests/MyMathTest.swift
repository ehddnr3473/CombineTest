//
//  MyMathTest.swift
//  CombineTestTests
//
//  Created by 김동욱 on 2022/12/11.
//

import XCTest
@testable import CombineTest

final class MyMathTest: XCTestCase {

    private let math = MyMath()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testAdd() {
        let result = math.add(0, 1)
        XCTAssertEqual(result, 1, "failed, \(result)")
    }
    
    func testSub() {
        let result = math.subtract(3, 4)
        XCTAssertEqual(result, -1)
    }
    
    func testMultiply() {
        let result = math.multiply(18, 5)
        XCTAssertTrue(result < 500)
        
    }
    
    func testDevide() {
        let result = math.devide(4, 3)
        XCTAssertNil(result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
