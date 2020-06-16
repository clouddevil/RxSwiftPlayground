//
//  DeinitTest.swift
//  RxSwiftPlaygroundTests
//
//  Created by Eugene Kalinin on 16.06.2020.
//  Copyright © 2020 Eugene Kalinin. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxSwiftPlayground

class DeinitTest: XCTestCase {
    
    weak var weakVm: ConversationListViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExampleOk() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        do {
            let vm = ConversationListViewModel()
            weakVm = vm
            
            vm.observableListState().subscribe {
                var i = 0
                i += 1
            }.dispose()
        }
        
        // Ok no ref to self
        XCTAssert(weakVm == nil)
    }
    
    func testExampleFail() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        do {
            let vm = ConversationListViewModel()
            weakVm = vm
            
            vm.conversationListState.subscribe {
                var i = 0
                i += 1
            }.dispose()
        }
        
        // memory leak
        XCTAssert(weakVm == nil)
    }

}
