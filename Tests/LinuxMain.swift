#if !os(watchOS)
import XCTest

import DJWUIExtensionsTests

var tests = [XCTestCaseEntry]()
tests += DJWUIExtensionsTests.allTests()
XCTMain(tests)
#endif
