//
//  ResizableSheetUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 11/9/25.
//

import SwiftUI

struct ResizableSheetUI: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("click"){
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            myOtherView(detents: $detents)
//                .presentationDetents([.medium, .large])
//                .presentationDragIndicator(.hidden)
                .presentationDetents([.medium,.large], selection: $detents)
        }
    }
}


struct myOtherView: View{
    
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack{
                Button("med"){
                    detents = .medium
                }
                
                Button("larg"){
                    detents = .large
                }
            }

            
            
        }
        
    }
}


    
    
    
#Preview {
    ResizableSheetUI()
}
