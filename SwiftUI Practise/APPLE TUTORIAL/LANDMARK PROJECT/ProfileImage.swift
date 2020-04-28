//
//  ProfileImage.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 4/22/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI

struct ProfileImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
        
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(image: Image("turtlerock"))
    }
}
