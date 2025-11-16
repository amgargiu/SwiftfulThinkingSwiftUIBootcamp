//
//  ActionSheetExercise.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/2/25.
//

import SwiftUI

struct ActionSheetExercise: View {
    
    @State var actionSheetShown : Bool = false
    @State var selectedPostType : postType = .otherPost
    
    //covers the different cases for possible messages to show - this variable is accesible to all the func and views within this parent view (not outside of this view struct)
    enum postType {
        case otherPost
        case myPost
    }
    //would add some code somewhere else to determine when case is myPost vs OtherPost
    //Probably create a view for profile page that when it is opened we need to set the case here to myPost, then when we got to explore we set case of selectedPostType variable of type postType = to otherPost
    
    var body: some View {
        
        VStack{
            HStack{
                Circle().fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "person")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )
                Text("Antonio Gargiulo")
                Spacer()
                Button(action: {
                    selectedPostType = .otherPost
                    showActionSheet()
                    
                },
                       label: {
                    Image(systemName: "ellipsis")
                })
    
            }
            .padding(.horizontal)
            .background(Color.gray.opacity(0.2))
            
            Rectangle()
                .fill(Color.gray.opacity(0.5))
            //we did not define a frame so why does scale to fit work for this? Answer GPT is that swift treats rectagle as 1x1 square scale by default so filling out proportionally with width
                //.scaledToFit()
                .aspectRatio(1, contentMode: .fit)
            
        }
        .actionSheet(isPresented: $actionSheetShown) {
            actionSheetButtons()
        }
    }
    
    func showActionSheet(){
        actionSheetShown.toggle()
    }
    
    func actionSheetButtons() -> ActionSheet {
        //We are going to create buttons with functionalities within function call
        //Remeber this are of type ActionSheet.Button
        let cancelButton: ActionSheet.Button = .cancel(Text("Cancel"), action: {
            //code for Cancelling - dont really need this is just to dismiss action sheet
        })
        let shareButton: ActionSheet.Button = .default(Text("Share"), action: {
            //code for Sharing
        })
        let reportButton: ActionSheet.Button = .destructive(Text("Report"), action: {
            //code for reporting a post
        })
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete"), action: {
            //code for deleting a post
        })
        
        //can add switch within the function
        switch selectedPostType {
            case .myPost:
            return ActionSheet(title: Text("Hello"), message: Text("World"), buttons: [cancelButton, shareButton, deleteButton])
            case .otherPost:
            return ActionSheet(title: Text("Hello"), message: Text("World"), buttons: [cancelButton, shareButton, reportButton])
        }
        
    }

}

//#Preview {
//    ActionSheetExercise()
//}
