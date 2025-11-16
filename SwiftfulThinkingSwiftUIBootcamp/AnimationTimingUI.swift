//
//  AnimationTimingUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/28/25.
//

import SwiftUI

struct AnimationTimingUI: View {
    
    let timing: Double = 3
    @State var isAnimating = false
    
    var body: some View {
        VStack {
            
            Button("button"){
                isAnimating.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.spring(
                    response: 0.5,
                    dampingFraction: 0.7,
                    blendDuration: 1
                ), value: isAnimating)
//                .animation(Animation.linear(duration: timing))
//            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(Animation.easeIn(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeInOut(duration: timing), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(Animation.easeOut(duration: timing))
//            
            
        }
    }
}

//#Preview {
//    AnimationTimingUI()
//}
