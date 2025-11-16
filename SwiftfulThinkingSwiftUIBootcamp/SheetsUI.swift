//
//  SheetsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/29/25.
//

import SwiftUI

struct SheetsUI: View {
    
    @State var showSheet: Bool = false
    
    
    var body: some View {
        ZStack{
            
            //background layer
            Color.green
                .edgesIgnoringSafeArea(.all)
            
            
            
            Button(action: {
                showSheet.toggle()
            }, label:{
                Text("Button")
                    .padding(20)
                    .font(.headline)
                    .foregroundColor(.green)
                    .background(Color.white)
                    .cornerRadius(20)
            })
            
        }
        //Add it as a modifer look - need to bind it to an @State var using the $ sign
        .sheet(isPresented: $showSheet) {
            sheetScreen()
        }
    }
}

struct sheetScreen: View{
    
    
    // made an Env var with a key path
    // this is a binding variable that is binding to the current prsenttion of the view
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        
        ZStack (alignment: .topLeading){
            
            //background layer
            Color.red
                .edgesIgnoringSafeArea(.all)
    
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label:{
                Image(systemName: "xmark")
                    .padding(20)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            })
            
        }
        
        
    }
}


#Preview {
    SheetsUI()
    //sheetScreen()
}
