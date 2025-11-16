//
//  ToggleUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/2/25.
//

import SwiftUI

struct ToggleUI: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            
            HStack{
                
                Text("Status:")
                Text( toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            
            Toggle(
                isOn: $toggleIsOn,
                label: {
                    Text("Change Stus")
                })
            .toggleStyle(SwitchToggleStyle(
                tint: .red
            ))
            
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    ToggleUI()
}
