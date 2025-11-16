import SwiftUI

struct ReviewPopUpScreen: View {
    
    @State private var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button("Show Popup") {
                    withAnimation(.easeInOut) {
                        showNewScreen.toggle()
                    }
                }
                .font(.largeTitle)
                
                Spacer()
            }
            
            if showNewScreen {
                NewScreen(showNewScreen: $showNewScreen)
                    .transition(.move(edge: .bottom)) // move in & out
                    .zIndex(1) // ensure it sits above background
                    .padding(.top, 100)
            }
        }
    }
}

//-----------------------------------------

struct NewScreen: View {
    
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Purple rounded background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .ignoresSafeArea(edges: .bottom) // still extend to bottom if you want
            
            Button {
                withAnimation(.easeInOut) {
                    showNewScreen.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
            }
        }
    }
}


#Preview {
    ReviewPopUpScreen()
}
