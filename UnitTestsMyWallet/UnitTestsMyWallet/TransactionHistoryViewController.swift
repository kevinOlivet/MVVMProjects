//
//  TransactionHistoryViewController.swift
//  UnitTestsMyWallet
//
//  Created by Jon Olivet on 11/17/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

class TransactionHistoryViewController: UITableViewController {

  var viewModel: TransactionViewModelType = TransactionViewModel()
  private var history: [EntryViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.loadHistory() { [weak self] (history) in
      self?.updateTableView(newHistory: history)
    }
}

  @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  private func updateTableView(newHistory history: [EntryViewModel]) {
    DispatchQueue.main.async {
      self.history = history
      self.tableView.reloadData()
    }
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return history.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let reuseIdentifier = "reuseIdentifier"
    
    var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    cell.textLabel?.text = history[indexPath.row].value
    
    return cell
  }
  
  
}
