//
//  iMultiplyTests.swift
//  iMultiplyTests
//
//  Created by Cory Steers on 3/3/19.
//  Copyright © 2019 Cory Steers. All rights reserved.
//

@testable import iMultiply
import XCTest

class iMultiplyTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testQuestionOperandsWithinBounds() {
        let question = Question()

        XCTAssertGreaterThanOrEqual(question.left, 1)
        XCTAssertGreaterThanOrEqual(question.right, 1)
        XCTAssertLessThanOrEqual(question.left, 12)
        XCTAssertLessThanOrEqual(question.right, 12)
    }

    func testQuestionStringIsFormattedCorrectly() {
        let question = Question(left: 5, right: 5, operation: .multiply)

        XCTAssertEqual(question.string, "What is 5 multiplied by 5?")
    }

    func testAddingWorks() {
        let question = Question(left: 5, right: 5, operation: .add)

        XCTAssertEqual(question.answer, 10)
    }

    func testStringInputWorksForTheWrongAnswer() {
        let question = Question(left: 5, right: 5, operation: .add)
        let game = iMultiply()
        let result = game.process("5", for: question)

        XCTAssertEqual(result, "Wrong!")
    }

    func testStringInputWorksForTheRightnswer() {
        let question = Question(left: 5, right: 5, operation: .add)
        let game = iMultiply()
        let result = game.process("10", for: question)

        XCTAssertEqual(result, "Correct!")
    }

    func testAnswerQuestionIncrementCounter() {
        let question = Question(left: 5, right: 5, operation: .add)
        let game = iMultiply()
        _ = game.process("10", for: question)
        XCTAssertEqual(game.questionNumber, 2)
    }

    func testGameCompletesAtEleventhQuestion() {
        let game = iMultiply()
        game.answerFunction = { return "556" }
        game.start()

        XCTAssertEqual(game.questionNumber, 11)
        XCTAssertEqual(game.score, 0)
    }
}
