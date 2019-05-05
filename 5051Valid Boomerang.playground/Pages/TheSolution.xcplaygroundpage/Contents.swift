import UIKit
import XCTest

class Solution {
  static func isBoomerang(_ points: [[Int]]) -> Bool {
    let setArray = Set(points)
    if setArray.count == points.count && !Solution.areInLine(points) {
      return true
    }
    return false
  }
  
  static func areInLine(_ points: [[Int]]) -> Bool {
    let xPoints = points.map{ $0[0] }
    let yPoints = points.map{ $0[1] }
    let difX0X1 = (xPoints[0] - xPoints[1])
    let difX0X2 = (xPoints[0] - xPoints[2])
    let difY0Y1 = (yPoints[0] - yPoints[1])
    let difY0Y2 = (yPoints[0] - yPoints[2])
    print("For points \(points)")
    print("Fist slope is (y0 - y1)/(x0 - x1) = \(difY0Y1/difX0X1)")
    print("Fist slope is (y0 - y2)/(x0 - x2) = \(difY0Y2/difX0X2)")
    
    return difY0Y1 * difX0X2 == difY0Y2 * difX0X1
  }
}
//let array = [[1,1],[2,3],[3,2]]
//let array = [[1,1],[2,2],[3,3]]
//let array = [[0,0],[2,1],[2,1]]
//let array = [[0,0],[2,1],[4,2]]
let array = [[1,0],[0,0],[2,0]]

let answer = Solution.isBoomerang(array)
print(answer)



class MyTests : XCTestCase {
  
  func testSimpleBoomerang() {
    // Given
    let array = [[1,1],[2,3],[3,2]]
    // When
    let answer = Solution.isBoomerang(array)
    
    // Then
    XCTAssertTrue(answer, "\(array) is a Boomerang")
  }
  
  func testDiagonalLine() {
    // Given
    let array = [[1,1],[2,2],[3,3]]
    // When
    let answer = Solution.isBoomerang(array)
    
    // Then
    XCTAssertFalse(answer, "\(array) is NOT a Boomerang")
  }
  
  func testRepeatedPoints() {
    // Given
    let array = [[0,0],[2,1],[2,1]]
    // When
    let answer = Solution.isBoomerang(array)
    
    // Then
    XCTAssertFalse(answer, "\(array) is NOT a Boomerang because it has repeated points")
  }
  
  func testDiagonalLine2() {
    // Given
    let array = [[0,0],[2,1],[4,2]]
    // When
    let answer = Solution.isBoomerang(array)
    
    // Then
    XCTAssertFalse(answer, "\(array) is NOT a Boomerang")
  }
  
  func testLineSameAxisInDisorder() {
    // Given
    let array = [[1,0],[0,0],[2,0]]
    // When
    let answer = Solution.isBoomerang(array)
    
    // Then
    XCTAssertFalse(answer, "\(array) is NOT a Boomerang because all the points are in the same axis")
  }
  
  func testDiagonalLine2InDisorder() {
    // Given
    let array = [[0,0],[4,2],[2,1]]
    // When
    let answer = Solution.isBoomerang(array)
    
    // Then
    XCTAssertFalse(answer, "\(array) is NOT a Boomerang becuase is in the same diagonal line in disorder")
  }
  
  
}


class PlaygroundTestObserver : NSObject, XCTestObservation {
  func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
    print("Test failed on line \(lineNumber): \(testCase.name ), \(description)")
  }
}

let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared
center.addTestObserver(observer)

struct TestRunner {
  
  func runTests(testClass:AnyClass) {
    print("Running test suite \(testClass)")
    
    let tests = testClass as! XCTestCase.Type
    let testSuite = tests.defaultTestSuite
    testSuite.run()
    let run = testSuite.testRun as! XCTestSuiteRun
    
    print("Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures")
  }
}

TestRunner().runTests(testClass:MyTests.self)
