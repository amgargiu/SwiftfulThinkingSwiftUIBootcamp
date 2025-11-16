//
//  ColorsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/22/25.
//

import SwiftUI

struct ColorsUI: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(
                //Color.primary
               // Color(#colorLiteral(red: 0.4971474409, green: 0.8929266334, blue: 0.9124276042, alpha: 1))
                //Color(UIColor.secondarySystemBackground)
                Color("CustomColor")
            )
            .frame(width: 200, height: 200)
//            .shadow(radius: 10)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 20, x: 0, y: 20)
        
    }
}

#Preview {
    ColorsUI()
}
