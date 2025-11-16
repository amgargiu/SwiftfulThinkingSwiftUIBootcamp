//
//  TernaryUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/28/25.
//

import SwiftUI

struct TernaryUI: View {
    
    @State var isStartingState : Bool = false
    
    var body: some View {
       
        VStack{
            
            
            Button("Tap me \(isStartingState)"){
                isStartingState.toggle()
            }
            
            // not efficient in that a new rounded rectangle is created each time, just changing fill
//            if isStartingState{
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(Color.red)
//                    .frame(width: 200, height: 50)
//            } else {
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(Color.blue)
//                    .frame(width: 200, height: 50)
//            }
            
            
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? Color.red : Color.blue)
                .frame(
                    width: isStartingState ? 200 : 100,
                    height: 50)
            Text(isStartingState ? "ready" : "still Starting")
            
            
            
          Spacer()
        }
    }
}

#Preview {
    TernaryUI()
}
