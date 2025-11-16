//
//  ExtractedFuncs&ViewsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/27/25.
//

import SwiftUI

struct ExtractedFuncs_ViewsUI: View {
    
    @State var BGColor: Color = .yellow
    
//    init(BGColor: Color) {
//        self.BGColor = BGColor
//    }
    
    
    var body: some View {
        ZStack{
            
            //background layer
            //BGcolor is just a color basically
            BGColor.edgesIgnoringSafeArea(.all)
            
            //Content layer extracted below within this main view
            //after the body but before the last bracket exiting the view
            contentLayer
        }
    }
    
    //Extracted items
    
    var contentLayer: some View {
        VStack {
            
            Text("Title")
                .font(.largeTitle)
            
            Button(action: {
                    buttonPressed()
            },
                label: {
                    Text("Tap me")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
        }
    }
    
    func buttonPressed(){
        BGColor = .red
        
    }
    
}

//#Preview {
//    ExtractedFuncs_ViewsUI()
//}
