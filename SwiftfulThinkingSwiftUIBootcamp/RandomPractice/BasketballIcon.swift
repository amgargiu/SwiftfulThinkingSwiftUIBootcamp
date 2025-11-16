//
//  ProgressCircle.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/23/25.
//

import SwiftUI

struct ProgressCircle: View {
    var body: some View {
        Image(systemName: "basketball")
            .resizable()
            .scaledToFit()
            .foregroundColor(.blue)
            .frame(width: 200, height: 200)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),
                                        .yellow]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: Color.blue, radius:10)
                )
        Circle()
            .trim(from: 0.3, to: 1.0)
            .fill(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
            .frame(width: 180, height: 180)
            .overlay(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.yellow, Color.orange]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 160, height: 160)
                )
        Rectangle()
            .fill(Color.blue)
            .frame(width: 90, height: 50)
            .frame(width: 180, height: 180, alignment: .topLeading)
            .background(Color.red)
            .frame(width: 300, height: 200, alignment: .bottomTrailing)
            .background(Color.yellow)
            .cornerRadius(20)
            .frame(maxWidth: .infinity, maxHeight: 400, alignment: .bottom)
            .background(Color(UIColor.secondarySystemBackground))
        
    }
}

#Preview {
    ProgressCircle()
}
