//
//  ShopView.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/12/25.
//

import SwiftUI

struct ShopView: View {
    
    @ObservedObject var playerViewModel: PlayerViewModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            AngularGradient(
                gradient: Gradient(colors: [.blue, .red]),
                center: .bottomTrailing
            ).edgesIgnoringSafeArea(.all)
            
            
            ScrollView {
                    VStack(spacing: 20.0) {
                        ForEach(0..<10) { i in
                            
                            let price: Int = i*50+50
                            
                            RoundedRectangle(cornerRadius: 23)
                                .fill(Color.yellow)
                                .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                                .padding(10)
                                .shadow(color: .blue, radius: 6)
                                .overlay() {
                                    Image(systemName: "gift.fill")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .scaledToFit()
                                        .onTapGesture {
                                            playerViewModel.money -= price
                                        }
                                }
                                .overlay(alignment: .bottomLeading) {
                                    Text("Item \(i)")
                                        .padding(20)
                                }
                                .overlay(alignment: .bottomTrailing) {
                                    HStack {
                                        
                                        Text("Price: \(price)")
                                        Image(systemName: "basketball")
                                    }
                                    .padding(20)
                                }


                        }
                    }
                    .padding(.top, 100)
                }
            
            VStack {
                Text("Available Ball Points:")
                    .foregroundStyle(.white)
                HStack {
                    Image(systemName: "basketball.circle")
                        .foregroundColor(.white)  // icon color
                    Text("\(playerViewModel.money)")
                }
                .font(.largeTitle)
                .foregroundStyle(.white)
            }
            .background(
            Capsule()
                .stroke(Color.white, lineWidth: 4)
                .fill(Color.blue)
                .frame(width: 200, height: 80)
            )
        }
        .navigationTitle("Store")             // <- Add this
    }
}

#Preview {
    ShopView(playerViewModel: PlayerViewModel())
}
