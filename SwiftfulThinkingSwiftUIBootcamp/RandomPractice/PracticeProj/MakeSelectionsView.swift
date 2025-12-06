


import SwiftUI

struct MakeSelectionsView: View {
    
    @ObservedObject var playerViewModel: PlayerViewModel
    @Binding var picksMadeNumber: Int
    @State private var pickStatCounter = 1
    @State private var showOptions = false
    @State private var statTextType: DecisionType = .points
    
    enum DecisionType: String {
        case points = "Who will have the most Points tonight"
        case rebounds = "Who will have the most Rebounds tonight"
        case assists = "Who will have the most Assists tonight"
        case done = "Submit your Picks!"
    }
    
    var body: some View {
        ZStack {
            AngularGradient(colors: [.yellow, .blue],
                            center: .topLeading,
                            angle: .degrees(225))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text(statTextType.rawValue)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.top, 80)
                
                searchBar
                    .padding(.bottom, 30)
                
                if pickStatCounter < 4 {
                    picksOptions
                } else {
                    submitButton
                }
                
                Spacer()
                
                selectedPicksView
            }
        }
        .onAppear {
            animateOptions()
        }
    }
    
    // MARK: - Subviews
    
    private var searchBar: some View {
        Capsule()
            .fill(Color.white)
            .frame(width: 300, height: 50)
            .overlay(alignment: .leading) {
                Image(systemName: "magnifyingglass.circle")
                    .font(.largeTitle)
                    .padding(.leading, 10)
            }
            .onTapGesture {
                showOptions.toggle()
            }
    }
    
    private var picksOptions: some View {
        VStack {
            HStack {
                if showOptions {
                    SelectShapeView3(player: playerViewModel.playerPair.0)
                        .onTapGesture { handlePick(player: playerViewModel.playerPair.0) }
                        .transition(.move(edge: .leading))
                }
            }
            
            HStack {
                if showOptions {
                    SelectShapeView3(player: playerViewModel.playerPair.1)
                        .onTapGesture { handlePick(player: playerViewModel.playerPair.1) }
                        .transition(.move(edge: .trailing))
                }
            }
        }
        .background(Color.black.opacity(0.3))
        .frame(height: 100)
    }
    
    private var submitButton: some View {
        NavigationLink(destination: MyPicksView(playerViewModel: playerViewModel)) {
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
    
    private var selectedPicksView: some View {
        VStack(spacing: 10) {
            Text("Pick Counter: \(pickStatCounter)")
            Text("Pick mn: \(picksMadeNumber)")

            ForEach(playerViewModel.selectedPicks) { pick in
                HStack {
                    pick.headshot
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(pick.name).font(.title).foregroundColor(.white)
                        Text(pick.team).font(.caption).foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .padding(4)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
            }
        }
        .padding()
    }
    
    // MARK: - Functions
    
    private func handlePick(player: PlayerModel) {
        pickStatCounter += 1
        statTextType = nextStat(for: pickStatCounter)
        playerViewModel.selectedPicks.append(player)
        animateOptions()
    }
    
    private func nextStat(for counter: Int) -> DecisionType {
        switch counter {
        case 1: return .points
        case 2: return .rebounds
        case 3: return .assists
        default: return .done
        }
    }
    
    private func animateOptions() {
        withAnimation {
            showOptions = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                playerViewModel.refreshPlayerPair()
                showOptions = true
            }
        }
    }
}

// MARK: - SelectShapeView

struct SelectShapeView3: View {
    let player: PlayerModel
    
    var body: some View {
        HStack {
            player.headshot
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                HStack {
                    Text(player.name).font(.headline)
                    Text(player.position).font(.caption).foregroundColor(.secondary)
                }
                Text(player.team).font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text("\(String(format: "%.1f", player.avgPts))")
                    .font(.headline)
                Text("PPG").font(.caption).foregroundColor(.secondary)
            }
        }
        .padding(5)
        .background(Color(#colorLiteral(red: 0.141, green: 0.263, blue: 0.4, alpha: 1)))
        .cornerRadius(10)
    }
}

 //MARK: - Preview

#Preview {
    MakeSelectionsView(playerViewModel: PlayerViewModel(), picksMadeNumber: .constant(1))
}

