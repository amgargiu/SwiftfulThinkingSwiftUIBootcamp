//
//  ExtractSubviewsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/27/25.
//

import SwiftUI

struct ExtractSubviewsUI: View {
    var body: some View {
        ZStack{
            
            //background
            Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            //content
            contentLayer
        }
    }

    var contentLayer: some View{
        HStack{
            MyItem(title: "ypppp", count: 5, color: .red)
            MyItem(title: "poojjjjp", count: 6, color: .blue)
            MyItem(title: "yppppip", count: 5, color: .red)
        }
    }
    
}

//#Preview {
//    ExtractSubviewsUI()
//}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack{
            Text("\(count)")
            Text(title)
        }
        .padding(20)
        .background(color)
        .cornerRadius(20)
    }
}
