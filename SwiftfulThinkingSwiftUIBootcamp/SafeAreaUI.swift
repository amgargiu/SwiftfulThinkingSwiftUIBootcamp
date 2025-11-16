//
//  SafeAreaUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/26/25.
//

import SwiftUI

struct SafeAreaUI: View {
    var body: some View {
        
        VStack{
            //Notice that color component below will ful the Z stack UNTIL the safe zone (respects it) - meabwhile the blue background below inherintly ignores which is helpful and intuitive
            //Color(.red)
            Text("hello friend")
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        
        
//        ScrollView{
//            Text("Title goes here")
//                .font(.largeTitle)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
//            Spacer()
//            
//            ForEach(0..<10){ index in
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(Color.white)
//                    .frame(height:150)
//                    .shadow(radius: 10)
//                    .padding()
//            }
//        }
//        .background(
//            Color.blue
//            .edgesIgnoringSafeArea(.all)
//        )
//        
//        ZStack {
//            
//            //background
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
//            
//            //Foreground
//            VStack {
//                Text("Hello, World!")
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }

    }
}

#Preview {
    SafeAreaUI()
}
