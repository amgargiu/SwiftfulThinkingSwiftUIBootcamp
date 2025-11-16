//
//  Padding&SpacerUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/24/25.
//

import SwiftUI

struct PaddingUI: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            Text("This is the description we will do on this screenit is multiple line and we will align the text to the leading edge")
        }
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 10,
                    x: 0,
                    y: 10
                )
            )
            .padding(.horizontal, 20)
    }
}

#Preview {
    PaddingUI()
}
