//
//  StepperUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/5/25.
//

import SwiftUI


struct StepperUI: View {
    
    @State var counter: Double = 100
    
    var body: some View {
        Text("counter: \(counter)")
        
        
        Stepper("value \(counter)", value: $counter, in: 0...10)

        RoundedRectangle(cornerRadius: 8)
            .fill(Color.blue)
            .frame(width: counter, height: 80)
            .animation(.spring(
                response: 0.8,
                dampingFraction: 0.4,
                blendDuration: 0.6
            ))
        
        
        Stepper("stepper 2") {
            //on increment
            increment(amount: 100)
        } onDecrement: {
            increment(amount: -100)
        }


        
    }
    
    func increment(amount: Double) {
        withAnimation() {
            counter += amount
        }
    }
    
}

#Preview {
    StepperUI()
}
