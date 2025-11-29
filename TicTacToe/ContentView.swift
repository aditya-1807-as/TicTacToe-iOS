import SwiftUI

struct ContentView: View {
    @State private var board = Array(repeating: "", count: 9)
    @State private var currentPlayer = "X"
    @State private var winner: String? = nil
    @State private var winningCells: [Int] = []

    let grid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                colors: [Color.purple.opacity(0.8), Color.blue.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 25) {

                // Status Text
                Text(statusText)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(radius: 4)

                // Game Grid
                LazyVGrid(columns: grid, spacing: 15) {
                    ForEach(0..<9) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white.opacity(0.15))
                                .frame(height: 100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(
                                            winningCells.contains(index)
                                                ? Color.green.opacity(0.85)
                                                : Color.white.opacity(0.4),
                                            lineWidth: winningCells.contains(index) ? 4 : 1.5
                                        )
                                )
                                .shadow(color: .black.opacity(0.3), radius: 4, y: 3)

                            Text(board[index])
                                .font(.system(size: 55, weight: .heavy))
                                .foregroundColor(.white)
                                .scaleEffect(board[index].isEmpty ? 0.5 : 1.0)
                                .animation(.spring(response: 0.4), value: board[index])
                        }
                        .onTapGesture { handleTap(index) }
                    }
                }
                .padding(.horizontal)

                // Restart Button
                Button(action: resetGame) {
                    Text("Restart")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 12)
                        .background(
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [Color.red.opacity(0.85), Color.orange.opacity(0.85)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        )
                        .shadow(radius: 6)
                }
                .padding(.top, 10)

                Spacer()
            }
            .padding(.top, 40)
        }
    }

    // MARK: - Status Text
    private var statusText: String {
        if let win = winner {
            return win == "Draw" ? "It's a Draw!" : "\(win) Wins!"
        }
        return "Turn: \(currentPlayer)"
    }

    // MARK: - Game Logic
    private func handleTap(_ index: Int) {
        guard winner == nil, board[index].isEmpty else { return }

        board[index] = currentPlayer
        checkWin()

        if winner == nil {
            currentPlayer = (currentPlayer == "X") ? "O" : "X"
        }
    }

    private func checkWin() {
        let winPatterns = [
            [0,1,2], [3,4,5], [6,7,8], // Rows
            [0,3,6], [1,4,7], [2,5,8], // Columns
            [0,4,8], [2,4,6]           // Diagonals
        ]

        for pattern in winPatterns {
            let values = pattern.map { board[$0] }

            if values.allSatisfy({ $0 == "X" }) {
                winner = "X"
                winningCells = pattern
                return
            }

            if values.allSatisfy({ $0 == "O" }) {
                winner = "O"
                winningCells = pattern
                return
            }
        }

        if board.allSatisfy({ !$0.isEmpty }) {
            winner = "Draw"
        }
    }

    private func resetGame() {
        board = Array(repeating: "", count: 9)
        currentPlayer = "X"
        winner = nil
        winningCells = []
    }
}
