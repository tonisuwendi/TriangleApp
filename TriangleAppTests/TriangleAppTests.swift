//
//  TriangleAppTests.swift
//  TriangleAppTests
//
//  Created by Toni Suwendi on 13/01/21.
//

import XCTest
@testable import TriangleApp

class TriangleAppTests: XCTestCase {
    
    func testInvalidInputDetectTriangle() {
        XCTAssertThrowsError(try detectTriangle(-1, -2, -3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
        }
    }
    
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga Sama Sisi")
    }
    
    func testDetectIsoscelesTriangle() {
        XCTAssertEqual(try detectTriangle(8, 8, 10), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(10, 10, 8), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(8, 10, 10), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(10, 8, 10), "Segitiga Sama Kaki")
    }
    
    func testDetectPythagorasTriangle() {
        XCTAssertEqual(try detectTriangle(6, 8, 10), "Segitiga Siku-Siku")
    }
    
    func testDetectRandomTriangel() {
        XCTAssertEqual(try detectTriangle(3, 5, 7), "Segitiga Sembarang")
    }
    
    func testInequalityTriangle() {
        XCTAssertThrowsError(try detectTriangle(4, 1, 2)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
        XCTAssertThrowsError(try detectTriangle(5, 1, 3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.inequalityInput)
        }
    }
    
    func detectTriangle(
        _ sideA: Int,
        _ sideB: Int,
        _ sideC: Int
    ) throws -> String {
        let sides = [sideA, sideB, sideC].sorted()
        for side in sides {
            if side < 0 {
                throw TriangleError.invalidInput
            }
        }
        
        if sides[1] + sides[0] <= sides[2] {
            throw TriangleError.inequalityInput
        } else if sides[0] == sides[1] && sides[0] == sides[2] {
            return "Segitiga Sama Sisi"
        } else if sides[0] == sides[1] || sides[1] == sides[2] {
            return "Segitiga Sama Kaki"
        } else if Double((sides[0] * sides[0] + sides[1] * sides[1])).squareRoot() == Double(sides[2]) {
            return "Segitiga Siku-Siku"
        } else {
            return "Segitiga Sembarang"
        }
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
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

enum TriangleError: Error {
    case invalidInput
    case inequalityInput
}
