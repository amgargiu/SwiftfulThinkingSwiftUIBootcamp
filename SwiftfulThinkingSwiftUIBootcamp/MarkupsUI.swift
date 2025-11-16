//
//  MarkupsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/5/25.
//

import SwiftUI

struct MarkupsUI: View {
    
    
    
    // MARK: PROPERTIES
    
    
    @State var data : [String] = [
        "apples", "bananas", "oranges", "pears", "grapes"
    ]
    @State var showAlert: Bool = false
    
    
    // MARK: BODY
    //comment here working on tigns to do: 1) fix title
    /*
     Doing a multiline comment
     here
     */
    
    var body: some View {
        NavigationView{ // START NAV
            contentLayer // don't need () this is a VAR not it's own view that needs an initilizer like the struct (those would be full subviews) - and not even a func
            .navigationTitle(Text("Documentation"))
            .navigationBarItems(
                trailing:
                Button("showAlert"){ showAlert.toggle() })
                    .alert(isPresented: $showAlert){
                        getAlert(title: "this is the alert")
                    }
        } // END NAV
    }
    
    /// This is the content layer that holds a scroll view and loop loopign through the loop data array
    var contentLayer : some View {
        ScrollView{ // START SCROLL
            Text("Helo")
            ForEach(data, id: \.self){ fruit in
                Text(fruit)
                    .font(.headline)
            }
        } // END SCROLL
    }
    
    
    
    // MARK: FUNCTIONS
    
    
    
    /// Gets an alert with a specified title
    ///
    /// This function creates and returns an alert, alert wioll have title based on the text parameter but it would not have a message
    ///
    /// - Warning: Unwrap optional
    /// - Parameter title: this is the title for the alert
    /// - Returns: returns an alert with a title
    func getAlert(title: String) -> Alert {
       return Alert(title: Text(title))
    }
}


// MARK: PREVIEW


#Preview {
    MarkupsUI()
}
