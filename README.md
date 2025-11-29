🎮 Tic-Tac-Toe iOS App (SwiftUI)

A beautifully designed 2-player Tic-Tac-Toe game built using SwiftUI.
This app demonstrates modern UI, animations, and basic game logic.

📱 Features:
🎯 Two-player gameplay (same device)
🎨 Modern UI with gradient background
✨ Smooth animations
💡 Winning cell highlight
🔁 Restart button
🏁 Win / Draw detection
🛠 Built entirely using SwiftUI

🖥️ Demo:
(Add your screen recording here by dragging it into GitHub later)
📂 Project Structure
TicTacToe/
 ├── ContentView.swift        # Main UI + game logic
 ├── SceneDelegate.swift      # Loads ContentView
 ├── AppDelegate.swift        # App life cycle
 ├── Assets.xcassets          # App icons & colors
 ├── LaunchScreen.storyboard  # Launch screen
 ├── Info.plist               # App settings
 └── TicTacToe.xcodeproj      # Xcode project file
Only ContentView.swift is modified — rest are default template files.

🚀 How to Run the Project:
Requirements:
1.macOS (VirtualBox or real Mac)
2.Xcode 12 or later
3.iOS Simulator (iPhone 13/14/15/SE)

Steps:
1.Clone the repository:
git clone https://github.com/yourusername/TicTacToe-iOS.git

2.Open the project in Xcode:
TicTacToe.xcodeproj
Select an iPhone simulator
Press Run ▶ to launch the app

🧠 How It Works
The game uses:
@State to store board values
LazyVGrid for the 3×3 board
Win detection using row/column/diagonal checks
Animation for piece placement
Restart clears all states

🎨 UI Design

Includes:
Purple–blue gradient background
Glass-style tiles
Neon-green win highlight
Smooth scaling animations
Modern capsule Restart button

🛠 Technologies Used:
1.Swift 5
2.SwiftUI
3.Xcode
4.macOS
