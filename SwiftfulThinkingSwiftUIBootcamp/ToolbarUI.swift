//
//  ToolbarUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/31/25.
//

import SwiftUI

struct ToolbarUI: View {
    
    @State var paths: [String] = []
    
    
    var body: some View {
        NavigationStack(path: $paths){
            
            ZStack{
                
                
                Color.indigo
                    .ignoresSafeArea()
                
                
                ScrollView {
                    ForEach(0..<40) { _ in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 300, height: 50)
                            .padding()
                    }
                    
                    
                    Text("Hey")
                        .foregroundStyle(.white)
                }

                
            }
            .navigationTitle(Text("Toolbar"))
//            .navigationBarItems(
//                leading: Image(systemName: "heart.fill"),
//                trailing: Image(systemName: "gear")
//            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
                
            }
            .toolbarTitleMenu {
                Button("Menu 1") {
                    paths.append("screen 1")
                }
                
                Button("Menu 2") {
                    paths.append("screen 2")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("new view \(value)")
            }
        }
    }
}

#Preview {
    ToolbarUI()
}
