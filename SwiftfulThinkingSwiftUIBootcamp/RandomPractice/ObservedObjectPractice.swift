//
//  ObservedObjectPractice.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/8/25.
//

import SwiftUI

class Example: ObservableObject {
    
    @Published var count: Int = 0
    @Published var buttonText: String = "Update"
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
    
    func toggleButtonText() {
        buttonText = "Reset"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.buttonText = "Update"
        })
    }
    
}




struct ObservedObjectPractice: View {
    
    @StateObject var ExampleView = Example()
    @State var frameHeight: Bool = false
    @State var showSheet: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(0..<20){ _ in
                            Rectangle()
                                .frame(width: 100, height: frameHeight ? 200 : 500)
                        }
                    }
                }
                
                Text("here is the count \(ExampleView.count)")
                
                Text(ExampleView.buttonText)
                    .frame(width: 300, height: 50)
                    .padding(10)
                    .background(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .onTapGesture { ExampleView.toggleButtonText(); showSheet.toggle()
                    }

                Button(action: {
                    ExampleView.increment()
                }, label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.largeTitle)
                })

                
                
                Spacer()

            }
            .navigationTitle(Text("ObservedObjectPractice"))
            .navigationBarItems(
                trailing:
                    Image(systemName: "plus")
                    .onTapGesture {
                frameHeight.toggle()
            }
            )
        
        } // End Nav
        .sheet(isPresented: $showSheet) {
            
                AnotherScreen(ExampleView: ExampleView)

            }
    }
}

struct AnotherScreen: View {
    
    @ObservedObject var ExampleView: Example //no need to initlize here
    
    var body : some View{
        
        
        VStack (alignment: .trailing, spacing: 20) {
            Text("counter is: \(ExampleView.count)")
            
            Button(action: {
                ExampleView.decrement()
            }, label: {
                Image(systemName: "arrow.down.circle.fill")
                    .font(.largeTitle)
            })
            
        }
    }
}



#Preview {
    ObservedObjectPractice()
}
