//
//  ShapesUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/22/25.
//

import SwiftUI

struct ShapesUI: View {
    var body: some View {
        Circle()
            //.fill(.red)
            //.foregroundColor(.purple)
//            .stroke()
            //.stroke(Color.blue, lineWidth: 1)
            //.stroke(Color.orange, style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10]))
            .trim(from: 0.20, to: 1.0)
            .stroke(Color.orange,lineWidth: 4.0 )
        RoundedRectangle(cornerRadius: 50)
            .fill(Color.blue)
//        Ellipse()
//            //.fill(Color.green)
//            .trim(from: 0.4, to: 1.0)
//            .stroke(Color.yellow, lineWidth: 3)
//            .frame(width: 200, height: 100)
        
    }
}

#Preview {
    ShapesUI()
}
