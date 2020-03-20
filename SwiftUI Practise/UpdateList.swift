//
//  UpdateList.swift
//  SwiftUI Practise
//
//  Created by Sterling Mortensen on 3/14/20.
//  Copyright © 2020 Sterling Mortensen. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: "Card1", title: "New Item", text: "Text", date: "Jan 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.white)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                    .lineLimit(2) // Makes it so only 2 lines show up in each cell and automatically adds in the ...
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            }, trailing: EditButton())
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "skate", title: "Vert", text: "Take your vert skate to the next level with this awesome lesson.", date: "JAN 1"),
    Update(image: "skate2", title: "Board Grabs", text: "Having trouble with grabbing your board? This course will help you finally stick those grabs you've been trying for years.", date: "OCT 17"),
    Update(image: "skate3", title: "Board Flips", text: "Quick and dirty is how my old man use to say. This will teach you strategic feet placement to get that board spinning how you want it.", date: "AUG 27"),
    Update(image: "skate4", title: "Park", text: "The park is where you really learn how to be a thug and skate like one too. ", date: "JUNE 26"),
    Update(image: "skate5", title: "Big Air", text: "Micheal Jordan did it best when it came to getting air. We can all observe the physics of him soaring through the air like a bat on drugs.", date: "JUN 11")
]
