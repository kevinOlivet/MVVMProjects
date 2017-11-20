//
//  TransactionViewModelTests.swift
//  UnitTestsMyWalletTests
//
//  Created by Jon Olivet on 11/17/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import XCTest
@testable import UnitTestsMyWallet

class TransactionViewModelTests: XCTestCase {
  
  var sut: TransactionViewModel!
  var testStorage: TestStorage!
  
  override func setUp() {
    testStorage = TestStorage()
    sut = TransactionViewModel(storage: testStorage)
  }
  
  //MARK: Incoming Query: Assert result
  
  func testLoadHistoryDoesReturn() {
    let expt = expectation(description: "completion")
    let value = 2.0
    let localizedValue = NumberFormatter.localizedString(from: NSNumber(value: 2.0), number: .currency)
    let expectedHistory = [EntryViewModel(value: localizedValue)]
    
    sut.loadHistory { (history) in
      XCTAssertEqual(history, expectedHistory)
      expt.fulfill()
    }
    
    testStorage.completion?([Entry(value: value)])
    
    waitForExpectations(timeout: 3) { (error) in
      XCTAssertNil(error)
    }
  }
}

