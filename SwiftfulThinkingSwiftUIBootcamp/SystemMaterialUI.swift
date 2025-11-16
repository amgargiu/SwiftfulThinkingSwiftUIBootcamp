//
//  SystemMaterialUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/28/25.
//

import SwiftUI

struct SystemMaterialUI: View {
    var body: some View {
        VStack{
            Spacer()
            
            VStack{
                
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text("Name")
                            .font(.headline)
                        Text("Description")
                            .font(.caption)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 50, height: 50, alignment: .leading)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding(.top)
                Spacer()
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .ignoresSafeArea(.all)
        .background(
            Image("lebron")
        )
    }
}

#Preview {
    SystemMaterialUI()
}
