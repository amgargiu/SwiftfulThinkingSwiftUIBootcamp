//
//  AnimationsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/28/25.
//
//
//import SwiftUI
//
//struct AnimationsUI: View {
//    
//    @State private var isAnimated: Bool = false
//    
//    var body: some View {
//        VStack {
//            
//            Button("Button") {
//                isAnimated.toggle() // no withAnimation needed
//            }
//            
//            Spacer()
//            
//            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
//                .fill(isAnimated ? Color.red : Color.green)
//                .frame(
//                    width: isAnimated ? 100 : 300,
//                    height: isAnimated ? 100 : 300
//                )
//                .rotationEffect(.degrees(isAnimated ? 360 : 0))
//                .offset(y: isAnimated ? 300 : 0)
//                .animation(.default.repeatForever(autoreverses: true), value: isAnimated) // ✅ only here
//            
//            Spacer()
//        }
//    }
//}
//
//#Preview {
//    AnimationsUI()
//}



import SwiftUI

struct AnimationsUI: View {
    
    @State private var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            
            Button("Button") {
                // Start the forever animation
                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    isAnimated.toggle()
                }
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(.degrees(isAnimated ? 360 : 0)) // smoother than 360°
                .offset(y: isAnimated ? 300 : 0)
            
            Spacer()
        }
    }
}

//#Preview {
//    AnimationsUI()
//}
