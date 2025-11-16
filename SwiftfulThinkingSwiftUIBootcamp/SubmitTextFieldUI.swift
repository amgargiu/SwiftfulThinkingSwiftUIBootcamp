//
//  SubmitTextFieldUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/31/25.
//

import SwiftUI

struct SubmitTextFieldUI: View {
    
    @State private var text = ""
    
    var body: some View {
        TextField("Placeholder...", text: $text)
            .submitLabel(.continue) // can customize for each text field
            .onSubmit {
                print("hellllooo") // this is prointed to the console
            }
    }
}

#Preview {
    SubmitTextFieldUI()
}
