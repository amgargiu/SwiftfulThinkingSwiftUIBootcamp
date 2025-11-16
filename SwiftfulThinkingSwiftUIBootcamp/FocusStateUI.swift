//
//  FocusStateUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/30/25.
//

import SwiftUI

struct FocusStateUI: View {
    
    @FocusState private var isFocused: Bool // dont need to give init value
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField("here", text: $text)
                .focused($isFocused)
                .padding(.leading, 10)
                .frame(height: 50)
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
        }
        .padding(40)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isFocused = true
            }
        }
    }
}

#Preview {
    FocusStateUI()
}
