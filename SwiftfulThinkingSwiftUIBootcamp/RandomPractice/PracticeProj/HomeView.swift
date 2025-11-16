//
//  HomeView.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var picksMadeNumber: Int = 0
    @State var picksCompleted: Bool = false
    @State var picksCompletionIcon: String = "xmark.circle.fill"
    @Binding var selectedTab : Int
    @ObservedObject var playerViewModel: PlayerViewModel

    var body: some View {
            ZStack {
                
                //BG Layer
                
                //LinearGradient(colors: [.red,.blue], startPoint: .leading, endPoint: .trailing)
                
                //RadialGradient(colors: [.red,.blue], center: .leading, startRadius: 1, endRadius: 500)
                
                AngularGradient(colors: [.yellow,.blue], center: .topLeading, angle: .degrees(225))
                    .edgesIgnoringSafeArea(.all)
                
                //Content Layer
                
                
                VStack (spacing: 20) {
                    Text("NBA Home Screen")
                        .frame(maxWidth: .infinity)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .stroke(Color.white, lineWidth: 4)
                                .fill(Color((#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))))
                                .ignoresSafeArea(edges: [])
                        )
                        .cornerRadius(40)
                        .shadow(radius: 10)
                        .padding()
                    
                    
                    //Profile Row
                    HStack{
                        
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60,height: 600)
                        
                        VStack (alignment: .leading, spacing: 10){
                            Text("TheBigChicken4560")
                                .foregroundColor(.black)
                                .font(.headline)
                            
                            
                            Text("Level 10")
                                .foregroundColor(.black)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        VStack{
                            ballPoints
                            
                            Label {
                                Text("100,000")
                                    .foregroundColor(.white)   // text color
                                    .font(.title3)
                            } icon: {
                                Image(systemName: "basketball.fill")
                                    .foregroundColor(.black)  // icon color
                                    .font(.title)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width-20, height: 80)
                    
                    Spacer()
                    
                    //Make Picks Button
                    NavigationLink {
                        MakeSelectionsView(playerViewModel: PlayerViewModel(), picksMadeNumber: $picksMadeNumber)
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color((#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))))
                            .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                            .shadow(color: .blue, radius: 5)
                            .overlay(
                                Text("Make Picks")
                                    .font(.title)
                                    .foregroundColor(.white)
                            )
                            .overlay(alignment: .bottomTrailing) {
                                Label {
                                    Text("\(picksMadeNumber) of 1 total picks made")
                                        .foregroundColor(.white)   // text color
                                } icon: {
                                    Image(systemName: picksCompletionIcon)
                                        .foregroundColor(.red)  // icon color
                                }
                                .padding(.trailing, 10)
                                .padding(.bottom, 5)
                            }
                    }

                    
                    
                    
                    
                    
                    //Shop Button
                    NavigationLink(destination: ShopView(playerViewModel: playerViewModel)) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color((#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))))
                            .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                            .shadow(color: .yellow, radius: 5)
                            .overlay(
                                HStack {
                                    Text("View Shop Deals!")
                                        .font(.title)
                                        .foregroundColor(.white)
                                    Image(systemName: "storefront.circle")
                                        .foregroundColor(.purple)
                                        .font(.largeTitle)
                                }
                            )
                            .onTapGesture {
                                selectedTab = 1
                            }
                    }
                    
                    
                    Button {
                        playerViewModel.money += 40000
                    } label: {
                        Text("Add Money")
                            .frame(width: UIScreen.main.bounds.width-40, height: 40)
                            .background(Color.orange
                                .edgesIgnoringSafeArea([])
                            )
                            .cornerRadius(20)
                            .shadow(radius: 5)
                    }
                    
                    Spacer()
                                        
                }
                
                
                
            }
        
    }
    
    var ballPoints: some View{
        VStack{
            Label {
                Text("\(playerViewModel.money)")
                    .foregroundColor(.white)   // text color
                    .font(.title3)
            } icon: {
                Image(systemName: "basketball.circle")
                    .foregroundColor(.purple)  // icon color
                    .font(.title)
            }
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant(0), playerViewModel: PlayerViewModel())
}
