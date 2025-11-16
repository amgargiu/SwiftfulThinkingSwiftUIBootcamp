//
//  TabViewUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/5/25.
//

import SwiftUI

struct TabViewUI: View {
    
    @State var selectedTab : Int = 2
    
    let icons : [String] = ["house", "magnifyingglass", "cart.fill", "person.circle"]
    
    var body: some View {
        
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit( )
                    .padding(30)
                    
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
        .background(
//                        AngularGradient(colors: [.red, .blue], center: .leading, angle: .degrees(180))
            RadialGradient(colors: [.red, .blue], center: .center, startRadius: 5, endRadius: 300)
        )
        
        
        //---------
        
        
//        TabView(selection: $selectedTab) {
//            
//            ///Extracted the Z stack view
//            ExtractedView(selectedTab: $selectedTab)
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
//                }
//                .tag(0)
//            
//            Text("Search tab")
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                }
//                .tag(1)
//            
//            Text("Profile tab")
//                .tabItem {
//                    Image(systemName: "person.circle")
//                    Text("Profile")
//                }
//                .tag(2)
//        }
//        .accentColor(.green)
        
        
    }
}

#Preview {
    TabViewUI()
}


//Have actual view for the full tab page in it's own struct

struct ExtractedView: View {
    
    @Binding var selectedTab : Int
    
    var body: some View {
        ZStack{
            //background
            Color.yellow.opacity(0.2)
                .ignoresSafeArea(.all)
            
            VStack{
                
                Text("Hello, World!")
                    .font(.largeTitle)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                
            }
        }
    }
}
