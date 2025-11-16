//
//  BindingUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/27/25.
//

import SwiftUI

struct BindingUI: View {
    
    @State var BGColor : Color = .blue
    @State var title : String = "Hello"

    
    var body: some View {
                
        ZStack{
            
            ///background
            BGColor.edgesIgnoringSafeArea(.all)
            
        
            //Content Layer
            VStack {
                
                Text(title)
                    .foregroundStyle(.white)
                ButtonView(BGColor: $BGColor, title: $title)
            }
        }
    }
}

//#Preview {
//    BindingUI()
//}

struct ButtonView: View {
    
    @Binding var BGColor : Color
    @State var buttonColor: Color = Color.red
    @Binding var title : String
    
    var body: some View {
        Button(action:{
            BGColor = Color.orange
            buttonColor = .purple
            title = "I was Tapped"
        }
               , label: {
            Text("Tap me")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(20)
        })
    }
}
