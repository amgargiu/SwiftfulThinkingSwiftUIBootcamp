//
//  OnAppearUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/7/25.
//

import SwiftUI

struct OnAppearUI: View {
    
    @State var counter: Int = 0
    
    var body: some View {
        NavigationView {

            ScrollView{
                Text("example")
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 20)
                            .frame( height: 300)
                            .padding()
                            .onAppear {
                                counter += 1
                            }
                    }
                }
            }
            .navigationTitle("onAppear: Counter: \(counter)")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(trailing: Button("Reload") { })
        }
        
    }
}

#Preview {
    OnAppearUI()
}
