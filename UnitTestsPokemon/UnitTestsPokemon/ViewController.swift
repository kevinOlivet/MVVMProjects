//
//  ViewController.swift
//  UnitTestsPokemon
//
//  Created by Jon Olivet on 11/14/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var viewModel: PokemonViewModel!
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var attackTypeLabel: UILabel!
  @IBOutlet weak var healthLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpSquirtle()
  }
  
  func setUpSquirtle() {
    viewModel = PokemonViewModel(name: "Squirtle", type: .water, attackType: .water, health: 100)
    nameLabel.text = viewModel.name
    typeLabel.text = "Pokemon type: \(viewModel.type)"
    attackTypeLabel.text = "Attack type: \(viewModel.attackType)"
    healthLabel.text = "Health: \(viewModel.health)"
  }
  
}
