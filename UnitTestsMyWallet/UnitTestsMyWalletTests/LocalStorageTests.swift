//
//  LocalStorageTests.swift
//  UnitTestsMyWalletTests
//
//  Created by Jon Olivet on 11/17/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import XCTest
@testable import UnitTestsMyWallet

class LocalStorageTests: XCTestCase {
  
  var sut: LocalStorage!
  
  override func setUp() {
    sut = LocalStorage()
  }
  
  //MARK: Incoming command: Assert direct public effects
  
  func testInitDoesStartBalanceZero() {
    let expected = 0.0
    
    let actual = LocalStorage().wallet.balance
    
    XCTAssertEqual(actual, expected)
  }
  
  func testAddValueWithPositiveValueDoesChangeWalletBalance() {
    let expected = 4.5
    
    sut.add(value: 4.5)
    
    let actual = sut.wallet.balance
    XCTAssertEqual(actual, expected)
  }
  
  func testAddValueWithNegativeValueDoesChangeWalletBalance() {
    let expected = -4.5
    
    sut.add(value: expected)
    
    let actual = sut.wallet.balance
    XCTAssertEqual(actual, expected)
  }
  
  //MARK: Incoming Query: Assert result
  
  func testLoadHistoryDoesCompleteWithRightValues() {
    let expec = expectation(description: "load history")
    
    let expectedHistory = [30.0, -20.0, 10.0].map { Entry(value: $0)}
    expectedHistory.forEach {
      sut.add(value: $0.value)
    }
    
    sut.loadHistory { history in
      XCTAssertEqual(history, expectedHistory)
      expec.fulfill()
    }
    
    waitForExpectations(timeout: 3) { (error) in
      XCTAssertNil(error)
    }
  }
  
}

