//
//  IntroViewUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/23/25.
//

import SwiftUI

import SwiftUI

struct IntroViewUI: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        
            ZStack{
                //BG Layer
                RadialGradient(colors: [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))],
                               center: .topLeading,
                               startRadius: 30,
                               endRadius: UIScreen.main.bounds.height)
                    .ignoresSafeArea(edges: .all)
                
                //
                
                
                if currentUserSignedIn {
                    ProfileViewUI()
                } else {
                    OboardingViewUI()
                }
                
                
                    
                }
            }
    }

#Preview {
    IntroViewUI()
}
