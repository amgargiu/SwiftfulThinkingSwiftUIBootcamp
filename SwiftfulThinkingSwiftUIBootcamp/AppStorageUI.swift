//
//  AppStorageUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/23/25.
//

import SwiftUI



struct AppStorageUI: View {
    
    @AppStorage("name") var name : String?
    
    
    var body: some View {
        
        VStack (spacing: 20) {
            Text("your name is : \(name ?? "none")")
            
            
            Button("Change Name") {
                name = "Antonio Gargiulo"
            
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
        
        Button("Clear") {
            name = nil
        
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.red)
        .cornerRadius(10)
    }
}

#Preview {
    AppStorageUI()
}
