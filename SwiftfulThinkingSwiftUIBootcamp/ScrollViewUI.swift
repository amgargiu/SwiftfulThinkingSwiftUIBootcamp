//
//  ScrollViewUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/26/25.
//

import SwiftUI

struct ScrollViewUI: View {
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0..<20) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                            
                            }
                        }
                    }
                    
                    
                }
                
            }
        }
    }

#Preview {
    ScrollViewUI()
}
