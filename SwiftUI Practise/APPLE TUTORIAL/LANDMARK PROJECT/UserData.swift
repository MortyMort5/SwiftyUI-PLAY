//
//  UserData.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 4/22/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
