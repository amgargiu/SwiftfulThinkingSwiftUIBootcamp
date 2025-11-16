//
//  PracticeStuff.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/27/25.
//

import SwiftUI

struct PracticeStuff: View {
    
    @State var gearColor: Color = .red
    @State var scrollGridColor: Color = .green
    @State var scrollGridImage: String = "heart.fill"
    let modality: mode
    let counter: Int
    
    
    // just made the counter varible to show associated variable - in the sense that if we know the enum case, we know the counter value, because if case is 1 than that means counter is 1. This is related to fruit example in video where if we have properties like color and fruit name, if we set a case of .orange, then we know color must be Orange and name must be "Orange"
    init(modality: mode) {
        self.modality = modality
        
        if modality == .one {
            self.counter = 1
        }else{
            self.counter = 2
        }
    }
    
    enum mode{
        case one
        case two
    }

    
    var body: some View {
        
        //There is no Spacing in a ZStack
        ZStack {
            
            
            VStack {
                
                InitialTopHStack(gearColor: $gearColor)
                
                    
                ScrollingItemsView(scrollGridImage: $scrollGridImage, scrollGridColor: $scrollGridColor)

                
                Text("jjjjj")
                    .frame(width: 100, height: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.red, lineWidth: 3)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .red]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                    )
                            )
                            .shadow(radius: 5)
                    )
                
                Text("test")
                    .padding()
                    .background(Color.green)
                    .shadow(radius: 5)
                
                
                Text("Here is the Counter property value determined by the Enum case: \(counter)")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .background(
                        Capsule()
                            .fill(
                                LinearGradient(colors: [.yellow, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .stroke(Color.blue, lineWidth: 3)
                    )
            
                Spacer()
                
                //Working with extracted views w/ custom inits
                //question here is that given how I am not going to a different page for any of these, do i need to extract them as full subviews? or can I just extract as views?
                HStack {
                    imageMessageView(imageSystemName: "person", messageText: "person")
                    imageMessageView(imageSystemName: "basketball", messageText: "sun")
                    imageMessageView(imageSystemName: "moon", messageText: "moon")

                }
                
                //Let put soemthign that's based on nab enum case here - for related vars, so like if gear color is blue, phrase diff
                Spacer()
                
                HStack (spacing: 30) {
                    GearButtonView(gearColor: $gearColor)
                    
                    BlueButtonView(scrollGridImage: $scrollGridImage, scrollGridColor: $scrollGridColor)
                    
                    
                    
                }
                
                
                Spacer()
            }

            
        }
        //The ZStack default fram is just is big as objects inside (unless we edit fame)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.blue.opacity(0.2)
                .ignoresSafeArea(edges: [])
        )
    }
    
}

struct imageMessageView: View {
    
    @State var imageSystemName : String
    @State var messageText : String
    
    var body: some View {
        VStack {
            Image(systemName: imageSystemName)
                .foregroundStyle(.white)
            Text(messageText)
        }
        .frame(width: 100)
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.blue)
        )
    }
}


//Button may just be changing something in this main view while it is on it - BUT point here is that this Button it's own view controlling/updating elements in another/main view

//This seperate view could be it's own file, it's own screen, and with the binding property we can perform actions on that sceen and update elements elswhere in the app

struct BlueButtonView: View {
    
    @Binding var scrollGridImage : String
    @Binding var scrollGridColor : Color
    
    var body: some View {
        Button(action: {
            scrollGridImage = "plus"
            scrollGridColor = Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1))
        }, label: {
            Text("Do Stuff")
                .fontWeight(.bold)
                .frame(width: 100, height: 30)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .fill(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
                        .shadow(radius: 1)
                )
            
        })
    }
}

struct ScrollingItemsView: View {
    
    @Binding var scrollGridImage : String
    @Binding var scrollGridColor : Color
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack (spacing: 15){
                ForEach(0..<15) { index in
                    Rectangle()
                        .fill(scrollGridColor)
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: scrollGridImage)
                                .font(.title)
                                .foregroundStyle(.white)
                        )
                    
                    
                }
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 150, height: 100)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 200, height: 100)
            }
            
            
        }
        .frame(width: 200, height: 150)
        .padding()
        .background(
            Color.yellow
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
        
    }
}

struct GearButtonView: View {
    
    @Binding var gearColor : Color
    
    var body: some View {
        Button(action: {
            gearColor = .green
        }, label: {
            Image(systemName: "gear")
                .font(.headline)
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Circle())
                .shadow(color: .red, radius: 5)
                .overlay(
                    Circle()
                        .fill(Color.red)
                    
                        .frame(width: 20, height: 20)
                        .shadow(color: .red, radius: 5, x: 2, y: 2)
                        .overlay(
                            Text("5")
                                .foregroundStyle(.white)
                        )
                    ,
                    alignment: .bottomTrailing
                )
        })
    }
}

struct InitialTopHStack: View {
    
    @Binding var gearColor : Color
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text("Testing some stuff out something in swift ui and I keep texting in this, more text here")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(#colorLiteral(red: 0.9254902002, green: 0.2352941176, blue: 0.1, alpha: 1)))
                        .shadow(color: .green, radius: 10)
                )
                .multilineTextAlignment(.leading)
            
            Image(systemName: "gear")
                .font(.system(size: 60, weight: .bold))
                .foregroundStyle(gearColor)
            Spacer()
            
            VStack {
                
                //Profile 1 with background
                Image(systemName: "person")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(Color.blue)
                        //                                    .frame(width: 50, height: 50)
                    )
                
                
                //Profile 2 with overlay
                Circle()
                    .fill(Color.blue)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "person")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    )
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 2)
                    )
                
                //Profile 3 new clip to image shape
                Image(systemName: "person")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        Color.blue
                    )
                    .clipShape(Circle())
                
                
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    PracticeStuff(modality: .two)
}
