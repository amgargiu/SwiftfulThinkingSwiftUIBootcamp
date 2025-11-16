//
//  AllPlayersView.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/12/25.
//

import SwiftUI

struct AllPlayersView: View {
    
    //will need to oberserve the class here to access the data, will loop through as a list
    @ObservedObject var playerViewModel: PlayerViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Text("Players Playing Today")
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
            }

        }
        .padding(.horizontal,20)
        
        List{
            ForEach(playerViewModel.allPlayerData) { player in
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
                .background(Color(#colorLiteral(red: 0.1411764706, green: 0.262745098, blue: 0.4, alpha: 1)))
                .cornerRadius(10)
                
                
            }
        }
        .listStyle(GroupedListStyle())
        .foregroundColor(.white)
    }
}

#Preview {
    AllPlayersView(playerViewModel: PlayerViewModel())
}
