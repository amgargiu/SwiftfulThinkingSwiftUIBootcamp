//
//  NavigationViewUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/30/25.
//

import SwiftUI

struct NavigationViewUI: View {
    var body: some View {
        
        NavigationView{
            ScrollView{
                
                NavigationLink("hrllo",
                               destination: myOtherScreen())
                
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .navigationTitle(Text("Navigation View"))
            //.navigationBarTitleDisplayMode(.inline)
            //.navigationBarHidden(true)
            .navigationBarItems(
                
                leading:
                    //leading buttons
                    
                    HStack {
                        NavigationLink (destination: {
                            myOtherScreen()
                        }, label: {
                            Image(systemName: "person.fill")
                        })
                        .accentColor(.yellow)
                        
                        //short hand of the above it seems
                        NavigationLink {
                            myOtherScreen()
                            
                        } label: {
                            Image(systemName: "flame.fill")
                        }
                        
                        
                        
                    }
                
                ,
                
                //trailing buttons
                
                trailing: NavigationLink(destination: {
                    myOtherScreen()
                }, label: {
                    Image(systemName: "gear")
                })
                .accentColor(.red)
                
                
                
            )
            
        }
      
        
        
        
        
   }
}

struct myOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            Color.red
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("red screen")
//                .navigationBarHidden(true)
            
            
            VStack {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },
                       label: {
                    Image(systemName: "chevron.left")
                })
                
                NavigationLink("Click Here", destination: Text("hello 3rd screen"))
                    
                    
            }
        }
    }
}




//#Preview {
//    NavigationViewUI()
//}
