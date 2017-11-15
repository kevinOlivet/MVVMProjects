//
//  Pokemon.swift
//  UnitTestsPokemon
//
//  Created by Jon Olivet on 11/14/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import Foundation

enum PokemonType {
  case neutral, fire, water
}

enum PokemonAttackType {
  case normal, fire, water
}

class Pokemon {
  
  var name: String
  var type: PokemonType
  var attackType: PokemonAttackType
  var health: Int
  
  init(name: String, type: PokemonType, attackType: PokemonAttackType, health: Int) {
    self.name = name
    self.type = type
    self.attackType = attackType
    self.health = health
  }
  
}

