//
//  MainView1.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/11/25.
//

import SwiftUI

// Setting up a custom type struct of a player
// Identifiable - Make ID field!
struct PlayerModel: Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let team: String
    let age: Int
    let position: String
    let avgPts: Double
    let avgReb: Double
    let avgAst: Double
    let headshot: Image
}


/*
 Creating a class to hold our player data, will hold:
 1 a data array to show when we search
 2 an empty data array we will (save data selection to)
 3 Will want to  place that saved array in the completed tower view
 */

class PlayerViewModel: ObservableObject {
    // Using a static array so we can access the data during initialization
    static let samplePlayers: [PlayerModel] = [
        PlayerModel(name: "Jalen Brunson", team: "New York Knicks", age: 32, position: "PG", avgPts: 29.1, avgReb: 5.4, avgAst: 6.8, headshot: Image("Jalen_Brunson")),
        PlayerModel(name: "LeBron James", team: "Los Angeles Lakers", age: 39, position: "SF", avgPts: 25.6, avgReb: 7.2, avgAst: 7.9, headshot: Image("lebron")),
        PlayerModel(name: "Tyrese Haliburton", team: "Indiana Pacers", age: 30, position: "PG", avgPts: 22.5, avgReb: 5.8, avgAst: 8.0, headshot: Image("tyrese_h")),
        PlayerModel(name: "Shai G Alexander", team: "Oklahoma City Thunder", age: 26, position: "SG", avgPts: 30.8, avgReb: 6.1, avgAst: 5.6, headshot: Image("SGA"))
    ]

    // Published data array for UI use
    @Published var allPlayerData: [PlayerModel] = samplePlayers

    // Tuple containing a single pair of players (will refresh each time)
    @Published var playerPair: (PlayerModel, PlayerModel)

    // Array to store selected picks during the game
    @Published var selectedPicks: [PlayerModel] = []

    // Just going to add User Money here - in practice believe this would be its own class
    @Published var money: Int = 50000

    init() {
        let index1 = Int.random(in: 0..<Self.samplePlayers.count)
        var index2 = Int.random(in: 0..<Self.samplePlayers.count)
        while index2 == index1 {
            index2 = Int.random(in: 0..<Self.samplePlayers.count)
        }

        // Initialize playerPair with two random players
        self.playerPair = (Self.samplePlayers[index1], Self.samplePlayers[index2])
    }
    
    //stupidly pasted this within the init :/ - make it's own thing
    func refreshPlayerPair() {
            let index1 = Int.random(in: 0..<allPlayerData.count)
            var index2 = Int.random(in: 0..<allPlayerData.count)
            while index2 == index1 {
                index2 = Int.random(in: 0..<allPlayerData.count)
            }
            self.playerPair = (allPlayerData[index1], allPlayerData[index2])
        }

}



struct MainView1: View {
    
    @StateObject var playerViewModel: PlayerViewModel = PlayerViewModel()
    @State var selectedTab : Int = 0

    
    var body: some View {
        TabView(selection: $selectedTab) {

            // 🏠 Home tab
                    NavigationView {
                        HomeView(selectedTab: $selectedTab, playerViewModel: playerViewModel)
                            .navigationTitle("Home Screen")   // each tab gets its own title
                            .navigationBarItems(
                                trailing: NavigationLink {
                                    Text("Imagine a settings view here")
                                } label: {
                                    Image(systemName: "gear")
                                })
                    }
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                    .onTapGesture {
                        selectedTab = 0
                    }
                    
                    
            // 🏪 Store tab
                    NavigationView {
                        ShopView(playerViewModel: playerViewModel)
                            .navigationTitle("Store")
                    }
                    .tabItem {
                        VStack {
                            Image(systemName: "storefront")
                            Text("Store")
                        }
                    }
                    .tag(1)
                    
                    
            
            
            // 📋 My Picks tab
                    NavigationView {
                        MyPicksView(playerViewModel: playerViewModel)
                            .navigationTitle("My Picks")
                    }
                    .tabItem {
                        VStack {
                            Image(systemName: "list.bullet")
                            Text("My Picks")
                        }
                    }
                    .tag(2)
                }
    }
}


#Preview {
    MainView1()
}
