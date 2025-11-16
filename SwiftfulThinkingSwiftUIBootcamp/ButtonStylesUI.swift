//
//  ButtonStylesUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/28/25.
//

import SwiftUI

struct ButtonStylesUI: View {
    var body: some View {
        
        
        VStack{
            
            Button("Button"){
                
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            Button("Button"){
                
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(.bordered)
            
            Button("Button"){
                
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .controlSize(.mini)
            .buttonStyle(.borderedProminent)
            
            Button("Button"){
                
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
            
            
            
            
            
            
        }
        
    }
}

#Preview {
    ButtonStylesUI()
}
