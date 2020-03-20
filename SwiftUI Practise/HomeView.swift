//
//  HomeView.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 3/11/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Skate Lake City")
                        .font(.system(size: 28, weight: .bold))
                        .modifier(CustomFontModifier(size: 28))
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original) // Removes the blue color of a button
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            self.showContent = true
                    }
                    
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20
                                    ), axis: (x: 0, y: 10.0, z: 0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                .offset(y: -30)
                
                HStack {
                    Text("Skate Tricks")
                        .font(.title).bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                    .offset(y: -60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "First Trick", text: "Easy", logo: "icon", image: Image("skate"), color: Color("card1")),
    Section(title: "Crazy Varial Flips", text: "Medium", logo: "icon", image: Image("skate4"), color: Color("card2")),
    Section(title: "Vert", text: "Hard", logo: "icon", image: Image("skate3"), color: Color("card3")),
    Section(title: "All in One Package", text: "Extreme", logo: "icon", image: Image("skate2"), color: Color.black)
]

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), color2: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), width: 44, height: 44, percent: 68, show: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 mins today")
                        .modifier(FontModifier(style: .caption))
                }
                .modifier(FontModifier())
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), color2: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), width: 44, height: 44, percent: 21, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), color2: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), width: 44, height: 44, percent: 32, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
