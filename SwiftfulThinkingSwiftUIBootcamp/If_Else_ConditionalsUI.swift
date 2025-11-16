//
//  If_Else_ConditionalsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/28/25.
//

import SwiftUI

struct If_Else_ConditionalsUI: View {
   
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false

    
    var body: some View {
        VStack (spacing: 20) {
//            Button("Circle Button \(showCircle.description)") {
//                showCircle.toggle()
//            }
//            
//            Button("Rectangle Button \(showRectangle.description)") {
//                showRectangle.toggle()
//            }
//            
//            if showCircle {
//                Circle()
//                    .frame(width: 100, height: 100)
//            }
//            
//            if showRectangle{
//                Rectangle()
//                    .frame(width: 100, height: 100)
//            }
//            
//            if showCircle || showRectangle{
//                RoundedRectangle(cornerRadius: 25)
//                    .frame(width: 200, height: 100)
//            }
            
            Button("Loading Button \(isLoading.description)") {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView("prepping")
            }
            
            
        Spacer()
        }
    }
}

#Preview {
    If_Else_ConditionalsUI()
}
