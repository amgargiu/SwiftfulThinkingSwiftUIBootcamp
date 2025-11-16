//
//  ButtonsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/27/25.
//

import SwiftUI



struct ButtonsUI: View {
    
    //@state is a new thing - allows us to hae the ability to change this property within struct
    @State var title: String = "Buttons"
    
    var body: some View {
        VStack (spacing: 20){
            
            Text(title)
            
            Button("Press Me"){
                self.title = "Button #1 Pressed"
            } .accentColor(.red)
            
            Button {
                self.title = "Button #2 Pressed"
            } label: {
                Text("DEAD")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Color.red
                            .cornerRadius(20)
                            .shadow(radius: 5)
                    )
            }
            
            Button {
                self.title = "Button #3 Pressed"
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 78, height: 78)
                    .shadow(radius: 10)
                    .overlay{
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))) // ← put cursor here, Xcode shows color picker
                        
                    }
            }
            
            Button {
                self.title = "Button #4 Pressed"
            } label: {
                Text("FINISH")
                    .font(.caption)
                    .bold(true)
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2)
                    )
                
                
                
            }
        }
    }}

//#Preview {
//    ButtonsUI()
//}
