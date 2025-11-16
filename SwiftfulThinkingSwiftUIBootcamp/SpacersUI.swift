//
//  SpacersUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/24/25.
//

import SwiftUI

struct SpacersUI: View {
    var body: some View {
        VStack() {
            HStack (spacing: 0){
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(Color.green)
                Image(systemName: "gear")
                
            }
            .font(.title)
            .padding(.horizontal)

            Spacer()
                .frame(width: 10)
                .background(Color.blue)
            
            // A nav bar for example
            Rectangle()
                .frame(height: 55)
        }
        //.background(Color.gray.opacity(0.5))
    }
}

#Preview {
    SpacersUI()
}
