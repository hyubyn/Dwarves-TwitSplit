//
//  TwitSplitTests.swift
//  TwitSplitTests
//
//  Created by Hyubyn on 12/10/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import XCTest

class UtilsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSplitStringContentSuccess() {
        // split into 2 messages
        let firstContent = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        let (firstBoolResult, firstContentArray) = Utils.splitMessage(content: firstContent)
        let (firstExpectedResult, firstExpectedArray) = (true, ["1/2 I can't believe Tweeter now supports chunking", "2/2 my messages, so I don't have to do it myself."])
        XCTAssertEqual(firstBoolResult, firstExpectedResult, "The bool value should be \(firstExpectedResult)")
        XCTAssertEqual(firstContentArray, firstExpectedArray, "The array should be \(firstExpectedArray)")
        
        // return original message
        let secondContent = "I can't believe Tweeter now supports"
        let (secondBoolResult, secondContentArray) = Utils.splitMessage(content: secondContent)
        let (secondExpectedResult, secondExpectedArray) = (true, ["I can't believe Tweeter now supports"])
        XCTAssertEqual(secondBoolResult, secondExpectedResult, "The bool value should be \(secondExpectedResult)")
        XCTAssertEqual(secondContentArray, secondExpectedArray, "The array should be \(secondExpectedArray)")
        
        // return array of 4 messages
        let thirdContent = "1234567890123456789012345678901234567890123456 1234567890123456789012345678901234567890123456 1234567890123456789012345678901234567890123456 1234567890123456789012345678901234567890123456"
        let (thirdBoolResult, thirdContentArray) = Utils.splitMessage(content: thirdContent)
        let (thirdExpectedResult, thirdExpectedArray) = (true, ["1/4 1234567890123456789012345678901234567890123456", "2/4 1234567890123456789012345678901234567890123456", "3/4 1234567890123456789012345678901234567890123456", "4/4 1234567890123456789012345678901234567890123456"])
        XCTAssertEqual(thirdBoolResult, thirdExpectedResult, "The bool value should be \(thirdExpectedResult)")
        XCTAssertEqual(thirdContentArray, thirdExpectedArray, "The array should be \(thirdExpectedArray)")
    }

    func testSplitStringContentFailed() {
        // return array with 1 value
        let firstContent = "I can't believe Tweeter now supportschunkingmymessages,soIdon'thavetodoitmyself."
        let (boolResult, contentArray) = Utils.splitMessage(content: firstContent)
        let (expectedResult, expectedArray) = (false, ["I can't believe Tweeter now"])
        XCTAssertEqual(boolResult, expectedResult, "The bool value should be \(expectedResult)")
        XCTAssertEqual(contentArray, expectedArray, "The array should be \(expectedArray)")
        
        // return empty array
        let secondContent = "supportschunkingmymessages,soIdon'thavetodoitmyself. I can't believe Tweeter now supports"
        let (secondBoolResult, secondContentArray) = Utils.splitMessage(content: secondContent)
        let (secondExpectedResult, secondExpectedArray) = (false, [String]())
        XCTAssertEqual(secondBoolResult, secondExpectedResult, "The bool value should be \(secondExpectedResult)")
        XCTAssertEqual(secondContentArray, secondExpectedArray, "The array should be \(secondExpectedArray)")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
