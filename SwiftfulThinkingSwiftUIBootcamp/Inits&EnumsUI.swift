//
//  Inits&EnumsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/25/25.
//

import SwiftUI

struct Inits_EnumsUI: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    
    //Parameters are the items being passed in - not the parameter for this function are NOT referencing the properties above - we could call them whatever
    init(count: Int, fruit: Fruit){
        //Withtin here the self.backgroudColor self.property is us referencing the let properties above and say to set them equal to the parameters we are passing into the init function. This is done for us/implicit for structs.
        self.count = count
        
        if fruit == .apple {
            self.backgroundColor = .red
            self.title = "Apples"
        } else {
            self.backgroundColor = .orange
            self.title = "Oranges"
        }
    }
    
    enum Fruit{
        case apple
        case orange
    }
    
    // Main body
    
    var body: some View {
        VStack (spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    HStack{
        Inits_EnumsUI(count: 10, fruit: .apple)
        Inits_EnumsUI(count: 55, fruit: .orange)
    }
}
