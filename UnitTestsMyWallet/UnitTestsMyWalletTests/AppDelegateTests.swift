//
//  AppDelegateTests.swift
//  UnitTestsMyWalletTests
//
//  Created by Jon Olivet on 11/17/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import XCTest
@testable import UnitTestsMyWallet

class AppDelegateTests: XCTestCase {
  
  var sut: AppDelegate!
  
  override func setUp() {
    sut = AppDelegate()
  }
  
  //MARK: Incoming Query: Assert result
  
  func testDidFinishLaunchingDoesReturnTrue() {
    let expected = true
    
    let actual = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
    
    XCTAssertEqual(actual, expected)
  }
  
}

