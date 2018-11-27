//
//  CharacterList.swift
//  StarWars
//
//  Created by jose on 11/26/18.
//  Copyright © 2018 jose. All rights reserved.
//

import Foundation

struct CharacterList: Decodable {
  let results: [Character] // has to match the JSON KEY!
}
