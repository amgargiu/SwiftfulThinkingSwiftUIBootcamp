//
//  TextUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/21/25.
//

import SwiftUI

struct TextUI: View {
    var body: some View {
        Text("hello wolrd")
//            .font(.body)
//            //.fontWeight(.semibold)
//            //.bold()
//            //.underline()
//            .underline(true, color: .red)
//            .italic()
//            //.strikethrough()
//            .strikethrough(true, color: .blue)
//            .font(.system(size: 24, weight: .semibold, design: .serif))
            .baselineOffset(10)
            .kerning(1)
            .multilineTextAlignment(.leading)
            .foregroundColor(.green)
            .frame(maxWidth: .infinity, alignment: .leading)
            .minimumScaleFactor(0.1)
        
        
        Text("hello")
//            .frame(width: 100, height: 100)
            .padding(10)
            .foregroundColor(.white)
            .background(
                Color.yellow)
            .shadow(radius: 10)

    }
}

#Preview {
    TextUI()
}
