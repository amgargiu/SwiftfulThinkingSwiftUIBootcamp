//
//  DarkModeUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/5/25.
//

import SwiftUI

struct DarkModeUI: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 20){
                    Text("primary")
                        .foregroundStyle(.primary)
                    Text("secondary")
                        .foregroundStyle(.secondary)
                    Text("black")
                        .foregroundStyle(.black)
                    Text("white")
                        .foregroundStyle(.white)

                }
            }
            .navigationTitle(Text("Dark Mode UI"))
        }
    }
}

#Preview {
    DarkModeUI()
}
