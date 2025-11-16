//
//  ListSwipeActionUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/28/25.
//

import SwiftUI

struct ListSwipeActionUI: View {
    
    @State var fruits : [String] = [
        "Apple", "Banana", "Orange", "Pineapple"
    ]
    
    var body: some View {
        
        List {
            ForEach(fruits, id: \.self) {
                Text($0)
            }
            //.onDelete(perform: deleteItems)
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                // can add all buttons we want
                
                Button("Arch"){
                    
                }
                .tint(.red)
                Button("Save"){
                    
                }
                .tint(.blue)
                Button("Junk"){
                    
                }
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                
                Button("share"){}
                    .tint(.green)
            }
        }
        
        Spacer()
        
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
            }
        }
        
    }
    
    func deleteItems(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
}

#Preview {
    ListSwipeActionUI()
}
