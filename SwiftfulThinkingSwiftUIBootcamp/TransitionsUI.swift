//
//  TransitionsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/28/25.
//

import SwiftUI

struct TransitionsUI: View {
    
    @State private var showSecondaryView = false
    
    var body: some View {
        ZStack (alignment: .bottom){
            
            VStack{
                
                Button("Title Button"){
                    withAnimation(.default.delay(1.0)){
                        showSecondaryView.toggle()
                    }
                }
                Spacer()
                
                
            }
            
            if showSecondaryView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: .opacity
                    ))
                    .animation(.easeInOut, value: showSecondaryView)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TransitionsUI()
}
