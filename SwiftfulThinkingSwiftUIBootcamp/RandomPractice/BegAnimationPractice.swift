//
//  BegAnimationPractice.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/29/25.
//

import SwiftUI

struct AnimationCurvesDemo: View {
    @State var rec = false
    @State var circ = false

    
    var body: some View {
        VStack(spacing: 40) {
            
            Button("Record") {
                withAnimation(.bouncy(duration: 3)){
                    rec.toggle()
                }
            }
            
            Button("Circle") {
                circ.toggle()
            }
            
            
            Rectangle()
                .fill(rec ? .red : .blue)
                .frame(width: 100, height: 100)
                .offset(x: rec ? 0 : 100)
                .rotationEffect(.degrees(rec ? 360 : 0))


            Circle()
                .fill(circ ? .red : .blue)
                .frame(width: 100, height: 100)

                .animation(.easeInOut(duration: 1), value: circ)
                .offset(x: circ ? 100 : 0)
            
            
            Rectangle()
                .frame(width: rec ? 300 : 100, height: rec ? 300 : 100)
                .animation(Animation.spring(duration: 0.3), value: rec)
            
        }
    }
}

//#Preview {
//    AnimationCurvesDemo()
//}

