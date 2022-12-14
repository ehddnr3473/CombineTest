//
//  NetworkTaskTest.swift
//  CombineTestTests
//
//  Created by 김동욱 on 2022/12/14.
//

import XCTest
@testable import CombineTest

final class NetworkTaskTest: XCTestCase {
    private var networkTask: NetworkTask!
    private var url: URL!

    // test case 메서드 실행 전마다 setUp() 실행하여 변수 초기화
    override func setUp() {
        networkTask = NetworkTask()
        url = URL(string: "https://randomuser.me/api/")
    }
    
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
    
    // 비동기 작업 - 네트워크 작업이 끝나기전 XCTAssert에 도달해버림.
    func testDownloadData() {
        var downloadedData: Data?
        URLSession.shared.dataTask(with: url) { data, _, _ in
            downloadedData = data
        }.resume()
        
        XCTAssertNotNil(downloadedData, "\(downloadedData)")
    }
    
    func testDownloadDataWithExpectation() {
        let expectation = expectation(description: "Download random user data")

        URLSession.shared.dataTask(with: url) { data, _, _ in
            XCTAssertNotNil(data, "data: \(String(describing: data))")
            expectation.fulfill()
        }.resume()
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testFailFetch() {
        var downloadedData: Data?
        networkTask.fetch(with: url) { data, error in
            XCTAssertNotNil(data)
            downloadedData = data
            XCTAssertNil(error)
        }
        // 비동기 네트워크 작업 때문에
        XCTAssertNil(downloadedData, "\(downloadedData)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
