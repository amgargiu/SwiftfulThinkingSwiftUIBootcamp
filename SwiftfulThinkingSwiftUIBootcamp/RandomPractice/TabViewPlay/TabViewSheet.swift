//
//  TabViewSheet.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/5/25.
//


import SwiftUI

struct CustomPageTabView: View {
    @State private var selection = 0

    var body: some View {
        VStack(spacing: 0) {
            // Swipeable pages
            TabView(selection: $selection) {
                ZStack {
                    Color.red
                    
                    Text("🏠 Home Page")
                        .font(.largeTitle)
                        .tag(0)
                }
                    
                ZStack {
                    Color.blue
                    Text("👤 Profile Page")
                        .font(.largeTitle)
                        .tag(1)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // swipeable without dots

            // Custom tab bar
            HStack {
                Spacer()

                Button {
                    selection = 0
                } label: {
                    VStack {
                        Image(systemName: "house.fill")
                            .font(.system(size: 22))
                        Text("Home")
                            .font(.caption)
                    }
                    .foregroundColor(selection == 0 ? .blue : .gray)
                }

                Spacer()

                Button {
                    selection = 1
                } label: {
                    VStack {
                        Image(systemName: "person.fill")
                            .font(.system(size: 22))
                        Text("Profile")
                            .font(.caption)
                    }
                    .foregroundColor(selection == 1 ? .blue : .gray)
                }

                Spacer()
            }
            .padding(.vertical, 10)
            .background(Color(UIColor.systemGray6))
        }
        .ignoresSafeArea(edges: .bottom) // Let the tab bar go to the bottom
    }
}

#Preview {
    CustomPageTabView()
}
