//
//  TextFieldUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/2/25.
//

import SwiftUI

struct TextFieldUI: View {
    
    @State var textInput: String = ""
    @State var textDataArray: [String] = []
    
    var body: some View {
        
        
    NavigationView {
            VStack{
                
                TextField("enter title", text: $textInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.blue)
                
                Button("Submit", action: {
                    
                    if validTextInput() {
                        submit()
                    }
                    
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    validTextInput() ? Color.blue : Color.gray.opacity(0.7)
                )
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                .disabled(!validTextInput())
             
                Spacer()
                
                //need to set data, id is usally self { _ in }
                ForEach(textDataArray, id: \.self) { text in
                    Text(text)
                }

            }
            .padding()
            .navigationTitle(Text("Page Tile"))
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(
                leading: Image(systemName: "person.circle"), trailing: Image(systemName: "person"))
        
        }
        
    }
    
    func submit() {
        textDataArray.append(textInput)
        textInput = "" //resetting after we press submit
    }
    
    //tried to do it my own way by creating a function that requires a string param and passing in textInput
    //In exercise technically cleaner to create an @state var above in main view and run it through this func, then use the bool returned for logic
    func validTextInput() -> Bool {
        if textInput.count >= 3 {
            return true
        }
        return false
    }
    
    
}

#Preview {
    TextFieldUI()
}
