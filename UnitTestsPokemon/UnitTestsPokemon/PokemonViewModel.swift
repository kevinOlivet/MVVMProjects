//
//  PokemonViewModel.swift
//  UnitTestsPokemon
//
//  Created by Jon Olivet on 11/14/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import Foundation

class PokemonViewModel {
  
  fileprivate var pokemon: Pokemon
  
  init(name: String, type: PokemonType, attackType: PokemonAttackType, health: Int) {
    self.pokemon = Pokemon(name: name, type: type, attackType: attackType, health: health)
  }
  convenience init(name: String, type: PokemonType, attackType: PokemonAttackType) {
    self.init(name: name, type: type, attackType: attackType, health: 100)
  }
  
  var name: String {
    return pokemon.name
  }
  
  var type: PokemonType {
    return pokemon.type
  }
  
  var attackType: PokemonAttackType {
    return pokemon.attackType
  }
  
  var health: Int {
    get { return pokemon.health }
    set { pokemon.health = newValue }
  }
  
  func attack(enemy: PokemonViewModel) {
    var damage = 30
    
    if enemy.type == .fire && attackType == .water {
      damage = 60
    }
    
    if enemy.type == .water && attackType == .fire {
      damage = 10
    }
    
    enemy.health -= damage
  }
  
  
  
}
