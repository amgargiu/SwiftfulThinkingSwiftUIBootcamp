//
//  AsyncImageUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/28/25.
//

import SwiftUI

struct AsyncImageUI: View {
    
    var url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/c/c4/LeBron_James%2C_25_November_2023_02_%28cropped%29.jpg" )
    
    var body: some View {
        
        //1 basic
        //AsyncImage(url: url)
        
        
        //2 placeholder, content image
//        AsyncImage(url: url) { Image in
//            Image
//                .resizable()
//                .frame(width: 200, height: 200)
//        } placeholder: {
//            ProgressView()
//        }

        
        //3 Async Phases
        AsyncImage(url: url) { AsyncImagePhase in
            //this returns 3 states empty, success, failure
            //The success is where we returns the image
            switch AsyncImagePhase {
            case .empty:
                Text("Empty")
            case .failure(let error):
                Text("Error: \(error)")
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            default:
                Text("Unknown")
            }
        }
        
        
    }
}

#Preview {
    AsyncImageUI()
}
