//
//  ImagesUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/22/25.
//

import SwiftUI

struct ImagesUI: View {
    var body: some View {
        Text("hi")
//        Image("tyrese_h")
//            .resizable()
//            //fit will keep the ratio of the original image but make sure it is within the bounds
//            //.aspectRatio(contentMode: .fit)
//            //.scaledToFill()
//            .frame(width: 300, height: 200)
//            //.clipped()
//            //.cornerRadius(150)
//            .clipShape(
//                Circle() // can use any shape
//            )
        Image("A-letter")
            //.renderingMode(.template)
            //Commented out  above as we went to assets folder and set render to template
            .resizable() ///Resizeable to the frame
            .scaledToFit()
            .frame(width: 300, height: 200)
            .foregroundColor(.purple)
            
        
        
    }
}

#Preview {
    ImagesUI()
}
