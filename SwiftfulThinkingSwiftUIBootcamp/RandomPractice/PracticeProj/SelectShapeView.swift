//
//  SelectShapeView.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/12/25.
//

import SwiftUI

struct SelectShapeView: View {
    
    @ObservedObject var playerViewModel: PlayerViewModel
    @State var pickStatCounter = 1
    
    
    
    
    
    var body: some View {
        
        let player = playerViewModel.playerPair.0
        
        
        HStack {
            player.headshot
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(
                    Circle()
                )
                .overlay() {
                    Circle().stroke(Color.gray, lineWidth: 1)
                }
            
            VStack (alignment: .leading) {
                HStack {
                    Text(player.name)
                        .font(.headline)
                    Text(player.position)
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                }
                Text(player.team)
                    .font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text("\(String(format: "%.1f", player.avgPts))")
                    .font(.headline)
                Text("PPG")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(5)
        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
        .cornerRadius(10)
        .foregroundStyle(.white)
        .frame(maxWidth: UIScreen.main.bounds.width*0.8)
        .onTapGesture {
            pickStatCounter += 1
        }
    }
}


//wanted them to use the same viewmodel created once and then one had playerpair tuple item .0 and the other .1. With different vm it creates twice so Shape1 was getting .0 of tuple 1 and shape2 was getting .1 of tuple 2
#Preview {
        let vm = PlayerViewModel()
        VStack {
            SelectShapeView(playerViewModel: vm)
            SelectShapeView2(playerViewModel: vm)
        }
}


struct SelectShapeView2: View {
    
    @ObservedObject var playerViewModel: PlayerViewModel
    
    
    var body: some View {
        
        let player = playerViewModel.playerPair.1
        
        HStack {
            player.headshot
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(
                    Circle()
                )
                .overlay() {
                    Circle().stroke(Color.gray, lineWidth: 1)
                }
            
            VStack (alignment: .leading) {
                HStack {
                    Text(player.name)
                        .font(.headline)
                    Text(player.position)
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                }
                Text(player.team)
                    .font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text("\(String(format: "%.1f", player.avgPts))")
                    .font(.headline)
                Text("PPG")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(5)
        .background(Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.7068242964)))
        .cornerRadius(10)
        .foregroundStyle(.white)
        .frame(maxWidth: UIScreen.main.bounds.width*0.8)
        .onTapGesture {
            //pickStatCounter += 1
        }
    }
}
