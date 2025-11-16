//
//  AnimationUpdatedUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 11/9/25.
//

import SwiftUI

struct AnimationUpdatedUI: View {
    
    @State var animate1: Bool = false
    @State var animate2: Bool = false

    
    var body: some View {
        ZStack {
            VStack (spacing: 40) {
                Button("Tap me 1") {
                    animate1.toggle()
                }
                
                Button("Tap me 1") {
                    animate2.toggle()
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                    // Frame belo wis frame for content above it - Means the item or content above will be alignment x (whatever we put)
                        .frame(maxWidth: .infinity, alignment: animate1 ? .leading : .trailing)
                        .background(Color.green)
                        .frame(maxHeight: .infinity, alignment: animate2 ? .top : .bottom)
                        .background(Color.orange)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.yellow)
            }
        }
        .animation(.bouncy, value: animate1)
        .animation(.linear(duration: 3), value: animate2)
    }
}

#Preview {
    AnimationUpdatedUI()
}
