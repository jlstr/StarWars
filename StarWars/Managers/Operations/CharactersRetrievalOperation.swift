//
//  CharactersRetrievalOperation.swift
//  StarWars
//
//  Created by jose on 11/26/18.
//  Copyright © 2018 jose. All rights reserved.
//

import Foundation

class CharactersRetrievalOperation: ConcurrentOperation<CharacterList> {
  
  // MARK: Instance Variables
  
  private let pageIndex: Int
  private let session: URLSession
  private var task: URLSessionTask?
  private var baseURL = URL(string: "https://swapi.co/api")
  
  // MARK: Constructor
  
  init(pageIndex: Int, session: URLSession = URLSession.shared) {
    self.pageIndex = pageIndex
    self.session = session
  }
  
  // MARK: Methods
  
  override func main() {
    var url = baseURL?.appendingPathComponent("people")
    var urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: false)!
    urlComponents.queryItems = [URLQueryItem(name: "page", value: "4")]
    
    url = urlComponents.url!
    print(url?.absoluteString)
 
    task = session.dataTask(with: url!) { data, response, error in
      if let error = error as NSError? {
        DispatchQueue.main.async {
          self.complete(result: .failure(error))
        }
      } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
        do {
          let characterList = try JSONDecoder().decode(CharacterList.self, from: data)
          
          DispatchQueue.main.async {
            self.complete(result: .success(characterList))
          }
        } catch let error {
          print(error.localizedDescription)
          
          DispatchQueue.main.async {
            self.complete(result: .failure(error))
          }
        }
      }
    }
    
    task?.resume()
  }
  
  override func cancel() {
    task?.cancel()
    super.cancel()
  }
}
