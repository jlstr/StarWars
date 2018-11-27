//
//  Character.swift
//  StarWars
//
//  Created by jose on 11/26/18.
//  Copyright © 2018 jose. All rights reserved.
//

import Foundation

struct Character: Decodable, CustomStringConvertible {
  var name: String
  
  var description: String {
    return "{ name: \(self.name) }"
  }
}
