//
//  ContextMenuUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/2/25.
//

import SwiftUI

struct ContextMenuUI: View {
    
    @State var BGColor: Color = Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            
            Text("This is your Home")
                . font(.headline)
            Text("You can customize this menu")
                .font(.subheadline)
        }
        .foregroundStyle(.white)
        .padding(30)
        .background(Color(BGColor))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .contextMenu {
            Button(action: {
                BGColor = Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1))
            }, label: {
                Label("hi", systemImage: "flame.fill")
            })
            
            Button(action: {
                BGColor = Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
            }, label: {
                Text("Hello")
            })
            
            Button(action: {
                BGColor = Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
            }, label: {
                Label("neverrrr", systemImage: "heart.fill")
            })
        }
        
        Rectangle()
            .frame(width: 300, height: 200)
            .foregroundColor(.gray)
            .opacity(0.3)
            .padding()
            .contextMenu{
                Button("hello"){}
            }

        
    }
}

#Preview {
    ContextMenuUI()
}
