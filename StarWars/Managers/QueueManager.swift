//
//  QueueManager.swift
//  StarWars
//
//  Created by jose on 11/26/18.
//  Copyright © 2018 jose. All rights reserved.
//

import Foundation

class QueueManager {
  
  lazy var queue: OperationQueue = {
    let queue = OperationQueue()
    return queue;
  }()
  
  // MARK: - Singleton
  
  static let shared = QueueManager()
  
  // MARK: - Addition
  
  func enqueue(_ operation: Operation) {
    queue.addOperation(operation)
  }
}
