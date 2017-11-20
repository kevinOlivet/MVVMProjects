//
//  WalletModelTests.swift
//  UnitTestsMyWalletTests
//
//  Created by Jon Olivet on 11/17/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import XCTest
@testable import UnitTestsMyWallet

class WalletModelTests: XCTestCase {
  
  //MARK: Incoming command: Assert direct public effects
  
  func testInitDoesSetProperties() {
    let expected = 2.5
    
    let actual = WalletModel(balance: expected).balance
    
    XCTAssertEqual(actual, expected)
  }
  
  
}

