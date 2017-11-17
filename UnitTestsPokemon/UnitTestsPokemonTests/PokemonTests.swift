//
//  PokemonTests.swift
//  UnitTestsPokemonTests
//
//  Created by Jon Olivet on 11/14/17.
//  Copyright © 2017 Jon Olivet. All rights reserved.
//

import XCTest
@testable import UnitTestsPokemon

class PokemonTests: XCTestCase {
  
  var squirtle: PokemonViewModel!
  var charmander: PokemonViewModel!
  var psyduck: PokemonViewModel!
  
  override func setUp() {
    super.setUp()
    //given
    squirtle = PokemonViewModel(name: "Squirtle", type: .water, attackType: .water)
    charmander = PokemonViewModel(name: "Charmander", type: .fire, attackType: .fire)
    psyduck = PokemonViewModel(name: "Psyduck", type: .water, attackType: .water)
  }
  
  override func tearDown() {
    squirtle = nil
    charmander = nil
    psyduck = nil
    
    super.tearDown()
  }
  
  func testThatAWaterPokemonDoesMoreDamageToAFirePokemon() {
    //when
    // Have Squirtle attack Charmander
    squirtle.attack(enemy: charmander)
    
    // Have Squirtle attack Psyduck
    squirtle.attack(enemy: psyduck)
    
    //verify
    // If a water Pokemon does more damage to a fire Pokemon Charmander should have less health than Psyduck
    XCTAssertTrue(charmander.health < psyduck.health)
  }

  func testExactDamageDoneFromWaterToFirePokemon() {
    //when
    // Water attack fire = health 100 - 60
    squirtle.attack(enemy: charmander)
    
    // Water attack water = health 100 - 30
    squirtle.attack(enemy: psyduck)
    
    // Water attack fire = health 100 - 10
    charmander.attack(enemy: squirtle)
    
    //verify
    XCTAssertEqual(charmander.health, 40, "Charmander should have health 40")
    XCTAssertEqual(psyduck.health, 70, "Psyduck should have health 70")
    XCTAssertEqual(squirtle.health, 90, "Squirtle should have health 90")

  }
  
  
}
