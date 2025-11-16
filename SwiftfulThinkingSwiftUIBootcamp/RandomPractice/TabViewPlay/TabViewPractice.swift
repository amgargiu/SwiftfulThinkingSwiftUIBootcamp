//
//  eeeeeee.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/5/25.
//

import SwiftUI

struct SheetWithTabViewExample: View {
    @State private var showSheet = false

    var body: some View {
        VStack {
            Button("Open Sheet") {
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showSheet) {
            SheetContentView()
        }
    }
}

struct SheetContentView: View {
    var body: some View {
        TabView {
            
            Text("Home Tab")
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            
            Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .tabItem {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 500, height: 500)
                                .scaledToFit()
                        }
        }
        .presentationDetents([.medium, .large]) // optional, controls sheet height
        .tabViewStyle(PageTabViewStyle())
        .background(Color.secondary)
    }
}

#Preview {
    SheetWithTabViewExample()
}
