//
//  ViolinTests.swift
//  ViolinTests
//
//  Created by liuzhiyi on 2018/8/21.
//  Copyright © 2018年 Karma. All rights reserved.
//

import XCTest
import Moya
@testable import Violin

class ViolinTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRequest() {
        let expectations = expectation(description: "test")
        
        let service: LoginService = LoginService()
        service.request(methed: "login", parameters: "18575626156", "274d65c00e145da5fc96afcf50b72bf3", "123456", "wefwefweew", succeed: {(response: ViewLawyer) in
            debugPrint(response.realname!)
            expectations.fulfill()
            XCTAssertNotNil(response.realname)
        }, failure: {(error: NetworkError) in
            print("failurefailurefailurefailurefailurefailurefailurefailure")
        })
        let timeout = 15 as TimeInterval
        waitForExpectations(timeout: timeout, handler: nil)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
