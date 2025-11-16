//
//  AlertUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/1/25.
//

import SwiftUI

struct AlertUI: View {
    
    @State var showAlert: Bool = false
    @State var BGcolor: Color = Color.yellow
    
    //1st example way
    //@State var alertTitle: String = ""
    //@State var alertMessage: String = ""
    
    //2nd way with an Enum - 1 var here controlling both message and title
    @State var alertType: MyAlerts? = nil
    
    enum MyAlerts{
        case error
        case success
    }
    
    
    
    var body: some View {
        
        
        ZStack {
            
            //BG Layer
            
            BGcolor.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            
            
            
            VStack {
                Button("Button 1") {
                
                    //Switch within the function belwo determines the title and message for these enum cases
                    alertType = .error
//                    alertTitle = "Error uploading video 😔"
//                    alertMessage = "Please try again later"
                    showAlert.toggle()
                }
                Button("Button 2") {
                    alertType = .success

//                  alertTitle = "Succesful upload 😎"
//                  alertMessage = "nice job"
                    showAlert.toggle()
                }
                
            }
            .alert(isPresented: $showAlert) {
                //Alert(title: Text("error 1"), message: Text("World"))
                getAlert()
            }
            
        }
            
    }
    
    func getAlert() -> Alert {
//        return Alert( //get in habit to add return word
//            title: Text("Stop it now"),
//            message: Text("here is the description of this button"),
//            primaryButton: .destructive(Text("Delete"), action: {
//                BGcolor = .blue
//            }),
//            secondaryButton: .cancel())
        
        //Exercise 1 example
//        return Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            dismissButton: .default(Text("ok")))
        
        //2nd way with Enums
        switch alertType {
        case .error:
            return Alert(
                title: Text("Error"),
                message: Text("Something went wrong"),
                dismissButton: .default(Text("ok")))
        case .success:
            return Alert(
                title: Text("Success"),
                message: Text("Everything is fine"))
        default :
            return Alert(title: Text("Error"))
        }
    }
    
}

//#Preview {
//    AlertUI()
//}
