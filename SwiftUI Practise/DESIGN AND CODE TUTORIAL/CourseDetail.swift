//
//  CourseDetail.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 3/20/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetail: View {
    var course: Course
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(course.title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            Text(course.subtitle)
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        Spacer()
                        ZStack {
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }
                        }
                    }
                    Spacer()
                    WebImage(url: course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 140, alignment: .top)
                }
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
                    //        .frame(width: show ? screen.width :  screen.width - 60, height: show ? screen.height : 280)
                    .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280 )
                    .background(Color(course.color))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("Take your skating skills to the next level with this awesome crash course on how to skate better.")
                    
                    Text("About this course.")
                        .font(.title).bold()
                    
                    Text("Skateboarding, as we know it, was probably born sometime in the late 1940s, or early 1950s, when surfers in California wanted something to do when the waves were flat. This was called sidewalk surfing – a new wave of surfing on the sidewalk as the sport of surfing became highly popular.")
                    
                    Text("Sidewalks and skate parks \nOld swimming pools drained.\nKickflips and split lips; \nyoung ankles sprained. \nAerials and Varials \nand being called a punk. \nTail taps and  grip tape; \nand tricks that take *****. \nExercise that is ramped up; \nbalance in a curve. \nBackflips and Bearings \nnow don't loose your nerve! \nOllies and wallplants \nit's no passing fad. \nacid drops and nosestalls \nNot just boys being bad! \nRamps under carports \nand falling and pain. \nDaring and doing tricks \nagain and again \nInclines; expression \nand Five Oh grinds \nNollies and ledges \nand friendship that Binds. \nGo away Mr. Policemen: Just let us be. \nSkateboarding is not a crime! \nSo let us Skate free!")
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(course: courseData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
    }
}
