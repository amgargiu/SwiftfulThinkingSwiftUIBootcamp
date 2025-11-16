//
//  BadgesUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/28/25.
//

import SwiftUI

struct BadgesUI: View {
    var body: some View {
       
        List {
            Text("hhh")
                .badge(10)
            Text("hhh")
            Text("hhh")

        }
        
        
        TabView{
            
            Color.red
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .badge(10)
            
            Color.green
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
            
            
        }
    }
}

#Preview {
    BadgesUI()
}
