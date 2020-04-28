//
//  ProfileHost.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 4/24/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State var draftProfile = Profile.default
    
    var body: some View {
        Text("Profile for: \(draftProfile.username)")
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
