//
//  Background&OverlaysUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/23/25.
//

import SwiftUI

struct Background_OverlaysUI: View {
    var body: some View {
        
// ----------Background --------------
//        Text("Hello World")
//            //Can Apply the frame directly to the circle as well
//            //.frame(width: 100, height: 100)
//            .background(
//                //Color.red
////                LinearGradient(
////                    gradient: Gradient(colors: [.blue, .red]),
////                    startPoint: .topLeading,
////                    endPoint: .bottomTrailing
////                )
//                Circle()
//                    .fill(
//                        LinearGradient(colors: [Color.red, Color.blue], startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 100, height: 100)
//
//                    )
//            //Stacking backgrounds - red behind blue
//            .background(
//                Circle()
//                    .fill(
//                        LinearGradient(colors: [Color.blue, Color.red], startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 120, height: 120)
//            )
        
        
//------------------ overlay ----------------
        
//        Rectangle()
//            .fill(Color.green)
//            .frame(width: 100, height: 100, alignment: .leading)
//            .overlay(
//                Rectangle()
//                    .fill(Color.blue)
//                    .frame(width: 50, height: 50)
//                , alignment: .topLeading
//            )
//            .background(
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 150, height: 150)
//                // I guess bottom trailing for the background alignment is referencing the content inside the background... even tho it looks like the red rectangle is moving... Or it's saying where in the background the content should be?
//                ,alignment: .topLeading
//            )
        
        
        // ------------------ Exercise --------------------
        Image(systemName: "heart.fill")
            .foregroundColor(.white)
            .font(.system(size: 40))
            .background( //the background of the initial frame is a circle
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                            )
                    )
                    //make the frame large (circle will get larger since the background is the circle which is the frame size
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.3918667219)) , radius: 5, x: 0, y: 10)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.389874793)) , radius: 5, x: 5, y: 5)
                        ,
                        alignment: .bottomTrailing
                    )
            )
    }
}

//#Preview {
//    Background_OverlaysUI()
//}
