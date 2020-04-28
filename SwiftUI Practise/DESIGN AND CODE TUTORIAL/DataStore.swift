//
//  DataStore.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 3/20/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
