//
//  Examples.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/3/25.
//

import SwiftUI

struct BasicView: View {
    
    @State var showArrow = false // State variable
    
    @State var isAnimating = false // Lock flag
    
    @State var showSheet: Bool = false
    
    @State var bgColor: Color = .green


    var body: some View {
        
        
        
        VStack(spacing: 20) {
            
            Spacer()
            
            HStack{
                if showArrow {
                    TrailArrow()
                        .transition(AsymmetricTransition(
                            insertion: .move(edge: .leading),
                            removal: .opacity))
                        .animation(.easeInOut(duration: 0.9))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            
            
            HStack{
                Button(action: {
                
                    guard !isAnimating else { return } // Ignore taps while animating, isAnimating is our way of determining if in the middle of an animation. it starts with false since it is not animating at the moment. When we click 
                                    isAnimating = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                        isAnimating = false
                                    }
                
                    
                    withAnimation{
                        showArrow.toggle()
                    }
                }) {
                    Image(systemName: showArrow ? "chevron.compact.down" : "chevron.compact.up")
                }
                .padding()
                .background(
                    Color.yellow)
                .cornerRadius(10)
                
                
                Button(action: {
                    showSheet.toggle()
                },
                       label: {
                    Image(systemName: "plus")
                })
                .padding()
                .background(
                    Color.yellow)
                .cornerRadius(10)
                
                
            }
            
            HStack{
                if showArrow {
                    TrailArrow()
                        .rotationEffect(.degrees(180))
                        .transition(AsymmetricTransition(
                            insertion: .move(edge: .trailing),
                            removal: .opacity))
                        .animation(.easeInOut(duration: 0.9))
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Spacer()
            // Optional: Text to show the state of showArrow
            Text("Show Arrow: \(showArrow ? "True" : "False")")
                .font(.headline)
            TrailArrow()

            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(bgColor))
        .sheet(isPresented: $showSheet, content: {
            
            SheetScreen(bgColor: $bgColor)
            
        })
        
    }
}


struct TrailArrow: View {
    var color: Color = .blue
    var height: CGFloat = 60
    
    var body: some View {
        HStack(spacing: 0) {
            // Rectangle shaft
            Rectangle()
                .fill(color)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: height)
            
            // Triangle tip
            Triangle()
                .fill(color)
                .frame(width: height, height: height)
        }
    }
}

// Triangle Shape
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))                  // top-left
        path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2)) // tip
        path.addLine(to: CGPoint(x: 0, y: rect.height))     // bottom-left
        path.closeSubpath()
        return path
    }
}


struct SheetScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var bgColor: Color
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack (spacing: 30){
                Text("Hello, World!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                TabView {
                    Text("ho")
                    
                    Text("ho")
                }
                .frame(width: 350, height: 400)
                .tabViewStyle(PageTabViewStyle())
                .background(Color.white.opacity(0.9))
                
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dismiss")
                        .accentColor(.red)
                }
                
                Button(action: {
                    bgColor = .red
                }, label: {
                    Text("binding test")
                })
            }
        }
    }
}







//struct BasicView_Previews: PreviewProvider {
//    static var previews: some View {
//        BasicView()
//    }
//}

