//
//  GradientsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/22/25.
//

import SwiftUI

struct GradientsUI: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
//            .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
            .fill(
//                .red
                //Color.blue
//                LinearGradient(
//                    gradient: Gradient(colors: [.red, .blue]),
//                    startPoint: .topLeading,
//                    endPoint: .bottom)
//            )
//                LinearGradient(
//                    gradient: Gradient(colors: [
//                        Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),
//                        Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
//                    ]),
//                    startPoint: .topLeading,
//                    endPoint: .bottom
//                )
                RadialGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]),
                    center: .center,
                    startRadius: 1,
                    endRadius: 200)
//                AngularGradient(
//                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]),
//                    center: .topLeading,
//                    angle: .degrees(225))
)
            .frame(width: 300, height: 200)
    }
}

#Preview {
    GradientsUI()
}
