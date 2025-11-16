//
//  ColorPickerUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/3/25.
//

import SwiftUI

struct ColorPickerUI: View {
    
    @State var BGColor: Color = .green
    
    var body: some View {
        ZStack{
            
            BGColor.edgesIgnoringSafeArea(.all)
            
            ColorPicker("select a color",
                        selection: $BGColor,
                        supportsOpacity: true)
            .padding(20)
            .background(Color.black)
            .font(.headline)
            .cornerRadius(20)
            .foregroundStyle(.white)
            .padding(.horizontal)

        }
    }
}

#Preview {
    ColorPickerUI()
}
