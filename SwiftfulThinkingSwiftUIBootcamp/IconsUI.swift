//
//  IconsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/22/25.
//

import SwiftUI

struct IconsUI: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
            //.resizable()
            //.foregroundColor(Color.red)
            //.aspectRatio(contentMode: .fill)
            .font(.largeTitle)
            //.font(.system(size: 100))
            //.foregroundColor(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
            .frame(width: 300, height: 300)
            //.clipped()
        
        
        
    }
}

#Preview {
    IconsUI()
}
