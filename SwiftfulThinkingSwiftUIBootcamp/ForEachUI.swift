//
//  ForEachUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/25/25.
//

import SwiftUI

struct ForEachUI: View {
    
    let data: [String] = ["a", "b", "c"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            //for each data.indices is just saying for all indexes in array
            ForEach(data.indices) { index in
                Text("\(data[index]) at index: \(index)")
            }
        }
    }
}

#Preview {
    ForEachUI()
}
