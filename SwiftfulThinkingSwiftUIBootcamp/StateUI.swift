//
//  StateUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/27/25.
//

import SwiftUI


struct StateUI: View {
    
    @State var colorBG: Color = Color.green
    @State var count: Int = 0
    @State var title: String  = "Start"

    
    var body: some View {
        ZStack {
            
            //background
            colorBG
                .edgesIgnoringSafeArea(.all)

            //content
            VStack (spacing:20) {
                Text("\(title)")
                Text("count: \(count)")
                
                HStack (spacing: 20){
                    Button("Button 1") {
                        colorBG = .red
                        count += 1
                        title = "b1"
                    }
                    Button("Button 2") {
                        colorBG = .blue
                        count -= 1
                        title = "b2"

                    }
                }
            }
            .font(.largeTitle)
            .foregroundStyle(.white)
        }

    }
}

#Preview {
    StateUI()
}
