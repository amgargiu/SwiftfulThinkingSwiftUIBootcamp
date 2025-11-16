//
//  SafeAreaInsetUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 11/9/25.
//

import SwiftUI

struct SafeAreaInsetUI: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { index in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle(Text("SafeAreaInsetUI"))
            .safeAreaInset(edge: .bottom) {
                Text("safeAreaInset")
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
            }
        }
    }
}

#Preview {
    SafeAreaInsetUI()
}
