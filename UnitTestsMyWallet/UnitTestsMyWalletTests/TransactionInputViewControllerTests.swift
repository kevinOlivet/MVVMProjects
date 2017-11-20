//
//  TransactionInputViewControllerTests.swift
//  UnitTestsMyWalletTests
//
//  Created by Jon Olivet on 11/17/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import XCTest
@testable import UnitTestsMyWallet

class TransactionInputViewControllerTests: XCTestCase {
  var sut: TransactionInputViewController!
  
  override func setUp() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    sut = storyboard.instantiateViewController(withIdentifier: "InputVC") as! TransactionInputViewController
  }
  
  //MARK: Incoming command: Assert direct public effects
  
  func testLoadViewDoesSetOutlets() {
    loadSutsView()
    
    XCTAssertNotNil(sut.input)
    XCTAssertNotNil(sut.inputType)
  }
  
  func testViewDidLoadWithCreditTypeDoesSetLabelValue() {
    sut.type = .credit
    
    loadSutsView()
    
    XCTAssertEqual(sut.inputType.text, "Credit")
  }
  
  func testViewDidLoadWithExpenseTypeDoesSetLabelValue() {
    sut.type = .expense
    
    loadSutsView()
    
    XCTAssertEqual(sut.inputType.text, "Expense")
  }
  
  func testViewWillAppearDoesSetInputAsFirstResponder() {
    loadSutsView()
    setRootControllerSomeWindow(viewController: sut)
    
    sut.viewWillAppear(false)
    
    XCTAssert(sut.input.isFirstResponder)
  }
  
  func testDoneWithEmptyInputDoesNothing() {
    let vc = UIViewController()
    setRootControllerSomeWindow(viewController: vc)
    vc.present(sut, animated: false, completion: nil)
    XCTAssert(vc.presentedViewController == self.sut)
    
    var completionVal: Double?
    sut.completion = { value in
      completionVal = value
    }
    
    sut.done()
    
    self.eventually("does not dismiss sut") {
      let isStillPresented = vc.presentedViewController == self.sut
      let isEditing = self.sut.input.isEditing
      let isCompletionNotCalled = completionVal == nil
      
      let fullfilled = isEditing && isStillPresented && isCompletionNotCalled
      
      XCTAssert(fullfilled)
      return fullfilled
      
    }
  }
  
  //MARK: Outgoing command: Expect to send
  
  //⚠️ We're couped with UIKit implementation, not justing "expecting to send" ⚠️
  func testCancelDoesEndEditingDismiss() {
    let vc = UIViewController()
    setRootControllerSomeWindow(viewController: vc)
    vc.present(sut, animated: false, completion: nil)
    XCTAssert(vc.presentedViewController == self.sut)
    
    self.sut.cancel()
    
    self.eventually("dismiss sut") {
      let isDismissed = vc.presentedViewController == nil
      let isEditingEnded = self.sut.input.isEditing == false
      
      let fullfilled = isEditingEnded && isDismissed
      
      XCTAssert(fullfilled)
      return fullfilled
    }
  }
  
  func testDoneWithInputFilledDoesEndEditingDismissCallCompletion() {
    let vc = UIViewController()
    setRootControllerSomeWindow(viewController: vc)
    vc.present(sut, animated: false, completion: nil)
    XCTAssert(vc.presentedViewController == self.sut)
    
    var completionVal: Double?
    sut.completion = { value in
      completionVal = value
    }
    
    sut.input.text = "20.00"
    sut.done()
    
    self.eventually("dismiss sut") {
      let isDismissed = vc.presentedViewController == nil
      let isEditingEnded = self.sut.input.isEditing == false
      let isCompletionCalled = completionVal != nil
      
      let fullfilled = isEditingEnded && isDismissed && isCompletionCalled
      
      XCTAssert(fullfilled)
      return fullfilled
      
    }
  }
  
  //MARK: Helpers
  private func loadSutsView() {
    //trigger loadView (can't call directly) and viewDidLoad
    sut.loadViewIfNeeded()
  }
}

