//
//  NavigationStackUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/31/25.
//

import SwiftUI

struct NavigationStackUI: View {
    
    
    let fruits: [String] = ["Apples", "Bananas", "Oranges"]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack (spacing: 20) {
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                
                    
                    ForEach(0..<10) { x in
                        
                        NavigationLink(value: x) {
                            Text("NavigationLink \(x)")
                        }
                        
                    }
                } //End Vstack
            } // End ScrollView
            .navigationTitle(Text("NavigationStackUI"))
            .navigationDestination(for: Int.self) { value in
            mySecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in
            Text("other screen \(value)")
            }
        }
        
    }
}


struct mySecondScreen: View {
    
    let value: Int // when we init will need to pass this in
    
    init(value: Int) { //when we initilize the view - pass in a value
        self.value = value
        print("INIT SCREEN \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}



#Preview {
    NavigationStackUI()
}
