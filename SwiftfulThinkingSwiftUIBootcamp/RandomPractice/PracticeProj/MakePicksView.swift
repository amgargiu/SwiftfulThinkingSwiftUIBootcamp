//
//  MakePicksView.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/11/25.
//

import SwiftUI

struct MakePicksView: View {
    
    @ObservedObject var playerViewModel: PlayerViewModel
    @State var statTextType: DecisionType = .points
    @State var showAllPlayers: Bool = false // to hide then show selectors when we refresh
    @Binding var picksMadeNumber: Int
    @State var showOptions : Bool = false
    @State var isAnimating = false // Lock flag
    @State var pickStatCounter = 1
    
    enum DecisionType: String {
        case points = "Who will have the most Points tonight"
        case rebounds = "Who will have the most Rebounds tonight"
        case assists = "Who will have the most Assists tonight"
        case done = "Submit your Picks!"
    }
    
    
    var body: some View {
        
        ZStack {
            
            //BG Layer
            
            AngularGradient(colors: [.yellow,.blue], center: .topLeading, angle: .degrees(225))
                .edgesIgnoringSafeArea(.all)
            
            //Content Layer
            
            VStack {
                
                Text("\(statTextType.rawValue)")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.top, 80)
                
                Capsule()
                    .fill(Color.white)
                    .frame(width: 300, height: 50)
                    .overlay (alignment: .leading){
                        Image(systemName: "magnifyingglass.circle")
                            .font(.largeTitle)
                            .padding(.leading, 10)
                    }
                    .onTapGesture {
                        showAllPlayers.toggle()
                    }
                    .padding(.bottom, 30)
                
                
                //if statement for options, show submit at end
                if pickStatCounter < 4 {
                    
                    //the entire view with the player showing!
                    middle
                    
                } else {
                    NavigationLink {
                        MyPicksView(playerViewModel: playerViewModel)
                    } label: {
                        Text("Submit Picks")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .onTapGesture {
                                picksMadeNumber = 1
                            }
                    }


                }
                
                
                
                Spacer()
                
                Text("\(pickStatCounter)")
//                Text("show pick: \(playerViewModel.selectedPicks)")
//                Text("Chose: \(playerViewModel.selectedPicks.count)")
                ForEach(playerViewModel.selectedPicks) { pick in
                    
                    Capsule()
                        .frame(width: 400, height: 70, alignment: .leading)
                        .overlay(alignment: .leading) {
                            HStack {
                                
                                pick.headshot
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                
                                VStack {
                                    Text("\(pick.name)")
                                        .font(.title)
                                        .foregroundColor(.white)
                                    Text("\(pick.team)")
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                                
                            }
                            .padding(4)
                            .shadow(radius: 5)
                        }

                }
            }
            
        }
        .fullScreenCover(isPresented: $showAllPlayers) {
            AllPlayersView(playerViewModel: PlayerViewModel())
        }
        .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    withAnimation{
                        showOptions.toggle()
                    }
                })
            
        }
    }
    
    var middle: some View {
        VStack{
            HStack{
                if showOptions {
                    SelectShapeView(playerViewModel: playerViewModel)
                        .transition(AsymmetricTransition(
                            insertion: .move(edge: .leading),
                            removal: .opacity))
                        .onTapGesture {
                            //counter to track for enum
                            pickStatCounter += 1
                            //run function to set the state for enum
                            pickStat(counter: pickStatCounter)
                            
                            buttonRefreshLogicAnimate()
                            //add to array of picks
                            playerViewModel.selectedPicks.append(playerViewModel.playerPair.0)
                        }
                }
            }
            .frame(width: UIScreen.main.bounds.width ,height: 70, alignment: .leading)
            .padding(.top, 50)
            
            
            Button {
                buttonRefreshLogicAnimate()
            } label: {
                Image(systemName: "arrow.trianglehead.2.counterclockwise")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.red)
                    .clipShape(Circle())
                    .padding(5)
                
            }
            
            HStack{
                if showOptions {
                    SelectShapeView2(playerViewModel: playerViewModel)
                        .transition(AsymmetricTransition(
                            insertion: .move(edge: .trailing),
                            removal: .opacity))
                        .onTapGesture {
                            pickStatCounter += 1
                            pickStat(counter: pickStatCounter)
                            buttonRefreshLogicAnimate()
                            playerViewModel.selectedPicks.append(playerViewModel.playerPair.1)
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .background(Color.black.opacity(0.3))
    }
    
    
    func pickStat(counter: Int) {
        switch pickStatCounter {
        case 1:
            return statTextType = .points
        case 2:
            return statTextType = .rebounds
        case 3:
            return statTextType = .assists
        default:
            return statTextType = .done
        }
    }
    
    //adding to see if I can add this to OnTap Gesture
    func buttonRefreshLogicAnimate() {
        withAnimation{
            showOptions = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{
                playerViewModel.refreshPlayerPair()
                showOptions = true
            }
        }
    }
}

#Preview {
    MakePicksView(playerViewModel: PlayerViewModel(), picksMadeNumber: .constant(1))
}
