//
//  LoadingView.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 4/21/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading").frame(width: 200, height: 200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
