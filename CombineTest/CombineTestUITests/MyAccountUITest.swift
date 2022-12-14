//
//  MyAccountUITest.swift
//  CombineTestUITests
//
//  Created by 김동욱 on 2022/12/11.
//

import XCTest

final class MyAccountUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() {
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        XCTAssertTrue(tabBar.exists)
        
        let tabBarButton = app.buttons["Test"]
        XCTAssertTrue(tabBarButton.exists)
        
        tabBarButton.tap()
        
        let title = app.staticTexts["Log In"]
        // 특정 identifier가 없고, staticTexts에 정확한 문자열이 입력되지 않은 경우, 실패
//        let title = app.staticTexts["Login"]
        XCTAssertTrue(title.exists, "Log in label not found")
        
        let usernameField = app.textFields["Username"]
        XCTAssertTrue(usernameField.exists)
        
        usernameField.tap()
        usernameField.typeText("yeolmok")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")

        let button = app.buttons["Continue"]
        XCTAssertTrue(button.exists)
        
        button.tap()
       
        let accountLabel = app.staticTexts["Welcome, Yeolmok!"]
        XCTAssertTrue(accountLabel.exists)
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
