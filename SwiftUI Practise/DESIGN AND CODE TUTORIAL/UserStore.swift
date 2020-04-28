//
//  UserStore.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 4/21/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }        
    }
    @Published var showLogin = false
}
