//
//  CharactersManager.swift
//  StarWars
//
//  Created by jose on 11/26/18.
//  Copyright © 2018 jose. All rights reserved.
//

import Foundation

class CharactersManager {
  
  // MARK: - Instance Vars
  
  private let queueManager: QueueManager
  
  // MARK: - Constructor / Initializer
  
  init(withQueueManager queueManager: QueueManager = QueueManager.shared) {
    self.queueManager = queueManager
  }
  
  // MARK: - Fetch Method
  
  func retrieveCharacters(pageIndex: Int, completionHandler: @escaping (_ result: Result<CharacterList>) -> Void) {
    let operation = CharactersRetrievalOperation(pageIndex: pageIndex)
    operation.completionHandler = completionHandler
    queueManager.enqueue(operation)
  }
}
