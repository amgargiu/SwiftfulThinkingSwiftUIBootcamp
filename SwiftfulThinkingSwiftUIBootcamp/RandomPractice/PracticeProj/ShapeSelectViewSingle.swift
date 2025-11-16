import SwiftUI

struct PlayerBattleView: View {
    @ObservedObject var playerViewModel: PlayerViewModel
    
    @State private var pickCounter: Int = 1 // Controls which stat to display
    
    var body: some View {
        VStack(spacing: 30) {
            // Top player card (tuple index 0)
            ShapeSelectViewSingle(
                playerViewModel: playerViewModel,
                tupleIndex: 0,
                BGcolor: .blue,
                pickCounter: $pickCounter
            )
            
            // Bottom player card (tuple index 1)
            ShapeSelectViewSingle(
                playerViewModel: playerViewModel,
                tupleIndex: 1,
                BGcolor: .red,
                pickCounter: $pickCounter
            )
            
            // Button to refresh tuple and increment pickCounter
            Button(action: {
                playerViewModel.refreshPlayerPair()
                pickCounter = pickCounter % 3 + 1 // cycle 1 → 2 → 3 → 1
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
        }
        .padding()
    }
}

// MARK: - Child Player Card
struct ShapeSelectViewSingle: View {
    @ObservedObject var playerViewModel: PlayerViewModel
    var tupleIndex: Int //not state - I will pass in the vars for setup
    var BGcolor: Color // not stat eI will pass in these var for set-up
    @Binding var pickCounter: Int // Binding to parent pickCounter
    
    enum StatType {
        case points
        case rebounds
        case assists
    }
    
    // Computed variable stat type from pickCounter dynamically
    // made based on picker for this child view for readbaility purposes, could just go by picker but makes more sense that .pts = pts stat and ppg text
    private var displayStatType: StatType {
        switch pickCounter {
        case 1: return .points
        case 2: return .rebounds
        case 3: return .assists
        default: return .points
        }
    }
    
    // Compute the stat value based on player tuple and current stat type
    private var displayStat: Double {
        let player = tupleIndex == 0 ? playerViewModel.playerPair.0 : playerViewModel.playerPair.1
        
        switch displayStatType {
        case .points: return player.avgPts
        case .rebounds: return player.avgReb
        case .assists: return player.avgAst
        }
    }
    
    // computed variable - based on
    private var displayStatText: String {
        switch displayStatType {
        case .points: return "PPG"
        case .rebounds: return "REB"
        case .assists: return "AST"
        }
    }
    
    var body: some View {
        HStack(spacing: 15) {
            let player = tupleIndex == 0 ? playerViewModel.playerPair.0 : playerViewModel.playerPair.1
            
            player.headshot
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(player.name)
                    .font(.headline)
                Text(player.position)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(player.team)
                    .font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text(String(format: "%.1f", displayStat))
                    .font(.headline)
                Text(displayStatText)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(BGcolor)
        .cornerRadius(12)
        .foregroundColor(.white)
        .shadow(radius: 3)
    }
}

// MARK: - Preview
struct PlayerBattleView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBattleView(playerViewModel: PlayerViewModel())
            .previewLayout(.sizeThatFits)
    }
}
