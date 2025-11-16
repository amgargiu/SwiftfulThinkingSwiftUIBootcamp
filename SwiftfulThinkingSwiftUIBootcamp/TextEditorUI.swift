//
//  TextEditorUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/2/25.
//

import SwiftUI

struct TextEditorUI: View {
    
    @State var textEditorText : String = "start"
    @State var savedText : String = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 300)
                    .background(Color.purple)
                    .foregroundStyle(.orange)
               
                Button(action: {
                    savedText = textEditorText
                    textEditorText = ""
            },
                   label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
                
                Text(savedText)
                
                Spacer()
                
            }
            .padding()
            .background(Color.green)
            .navigationTitle(Text("Text Editor"))
        }
        
    }
    
    // not used since simple
    func save (){
        savedText = textEditorText
    }
    
    
}

#Preview {
    TextEditorUI()
}
