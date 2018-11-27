//
//  ViewController.swift
//  StarWars
//
//  Created by jose on 11/25/18.
//  Copyright © 2018 jose. All rights reserved.
//

import UIKit

class CharactersViewController: UITableViewController {
  
  // MARK: - Instance Variables
  
  fileprivate var characters = [Character]()
  fileprivate let charactersManager = CharactersManager()
  
  // MARK: - Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "basic")
    
    charactersManager.retrieveCharacters(pageIndex: 4) { result in
      switch result {
        case .success(let charactersList):
          self.characters = charactersList.results
          self.tableView.reloadData()
          break
        
        case .failure(let error):
          print(error.localizedDescription)
          break
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "basic") else {
      fatalError("Something went wrong!")
    }
    
    cell.textLabel?.text = characters[indexPath.row].name
    return cell
  }
}
