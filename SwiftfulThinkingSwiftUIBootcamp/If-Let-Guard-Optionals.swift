//
//  If-Let-Guard-Optionals.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/7/25.
//

import SwiftUI

struct If_Let_Guard_Optionals: View {
    
    @State var userID : String? = "user123"
    @State var initialText : String? = nil
    @State var isLoading : Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack{
                Text("If-Let")
                
                if let text = initialText {
                    Text("\(text)")
                }
                
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
            }

        }
    }
    
    func loadData() {
        isLoading = true
        if let userid = userID {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                initialText = "hello \(userid)"
                isLoading = false
            }
        } else {
            initialText = "no user ID"
            isLoading = false
        }
    }
    
    func loadData2() {
        isLoading = true
        
        guard let userid = userID else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                initialText = "No User ID"
                isLoading = false
                
            }
            return
        }
        
        isLoading = false
        return initialText = "hello \(userid)"

    }
}

//#Preview {
//    If_Let_Guard_Optionals()
//}
