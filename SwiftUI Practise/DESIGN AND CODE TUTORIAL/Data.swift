//
//  Data.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 3/20/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("URL is Empty")
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data from URL")
                completion([])
                return
            }
            
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }.resume()
    }
}
