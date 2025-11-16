//
//  SwiftUIView.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/5/25.
//

import SwiftUI

struct SliderUI: View {
    
    @State var slidervalue: Double = 5
    
    var body: some View {
        
        Text("\(slidervalue)")
        Text(
            String(format: "%.2f", slidervalue)
        )
        Slider(value: $slidervalue, in: 0...10, step: 1.0)
            .accentColor(.red)
        
    }
}

#Preview {
    SliderUI()
}
