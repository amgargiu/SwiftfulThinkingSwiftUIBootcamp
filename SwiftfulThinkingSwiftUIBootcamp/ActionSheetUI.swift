//
//  ActionSheetUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/2/25.
//

import SwiftUI

struct ActionSheetUI: View {
    
    @State var showActionSheet: Bool = false
    
    var body: some View {
        
        VStack{
            
            Button("Show ActionSheet") {
                showActionSheet.toggle()
            }
        }
        .actionSheet(isPresented: $showActionSheet, content: {
            getActionSheet()
        })
    }
    
    func getActionSheet() -> ActionSheet {
//        return ActionSheet(title: Text("Hello"))
        
        //below made the buttons for the action sheet
        let button1: ActionSheet.Button = .default(Text("Default"))
        let button2: ActionSheet.Button = .cancel(Text("Cancel"))
        let button3: ActionSheet.Button = .destructive(Text("Destructive"))
        
        return ActionSheet(title: Text("Hello"),
                           message: Text("msg"),
                           buttons: [button1, button2, button3])
        }

    }


//#Preview {
//    ActionSheetUI()
//}
