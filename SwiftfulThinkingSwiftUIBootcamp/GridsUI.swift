//
//  GridsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/26/25.
//

import SwiftUI

struct GridsUI: View {
    
    var column: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(
                columns: column,
                alignment: .center,
                spacing: 6,
                pinnedViews: [],
                content: {
                    ForEach(0..<50) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                })
            
        }
    }
}

#Preview {
    GridsUI()
}
