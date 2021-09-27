//
//  MiniGameTests.swift
//  MiniGameTests
//
//  Created by Johyeon Yoon on 2021/09/13.
//

import XCTest
@testable import MiniGame

class MiniGameTests: XCTestCase {
    var game : Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        XCTAssertEqual(game.calculatePoints(slideValue: 42), 999)
//    }
    
    func testScorePositive() {
        let guess = game.target + 5
        let score = game.calculatePoints(slideValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.calculatePoints(slideValue: guess)
        XCTAssertEqual(score, 95)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
