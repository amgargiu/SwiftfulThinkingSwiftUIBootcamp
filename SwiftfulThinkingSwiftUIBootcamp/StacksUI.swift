//
//  StacksUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/24/25.
//

import SwiftUI

struct StacksUI: View {
    var body: some View {
        VStack (spacing: 50) {
            ZStack{
                Circle()
                    .fill(.blue)
                    .frame(width: 100, height:100)
                Text("1")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            
            Circle()
                .fill(.blue)
                .frame(width: 100, height:100)
                .overlay(
                    Text("1")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    )
            
            Text("1")
                .foregroundColor(.white)
                .font(.largeTitle)
                .background(
                    Circle()
                        .fill(.blue)
                        .frame(width: 100, height:100)
                    )
            
        }
    }
}

#Preview {
    StacksUI()
}
