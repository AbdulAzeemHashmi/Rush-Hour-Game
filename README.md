# 🚗 Rush Hour – GLUT Ultimate Edition  
*An adrenaline-fueled taxi delivery game with dual roles, fuel management, real-time scoring, and competitive leaderboards.*

---

## 🎮 About

This is a **fast-paced Rush Hour** game written in **C++17** using **OpenGL/GLUT** and **SDL2 audio**.  
Drive a taxi through urban streets to pick up passengers and deliver them to destinations, or switch to courier mode to make deliveries. Manage your fuel, beat the clock, and earn high scores while climbing the leaderboard.  
Everything happens **inside one window** with **real-time HUD**, **collision detection**, **audio feedback**, and **role-based gameplay mechanics**.

---

## ✨ Features

| Feature | Included |
|---------|----------|
| 🚕 **Dual roles** (Taxi Driver & Courier) | ✅ |
| ⏱️ **3-minute timed missions** with countdown | ✅ |
| ⛽ **Fuel management system** with stations | ✅ |
| 🧍 **Passenger pickup & dropoff** mechanics | ✅ |
| 📦 **Delivery point system** | ✅ |
| 💰 **Dynamic scoring & money rewards** | ✅ |
| 🔊 **SDL2 audio** (pickup/delivery sounds) | ✅ |
| 🎨 **Color-coded game entities** (cyan passengers, green deliveries, orange fuel) | ✅ |
| 🏆 **Binary leaderboard** (`leaderboard.dat`) with Top 5 display | ✅ |
| ⚙️ **Makefile build system** | ✅ |
| 🖱️ **Mouse & keyboard controls** | ✅ |
| 📊 **Real-time HUD display** | ✅ |

---

## 🚀 Quick Start

### 1. Install Dependencies

| OS | Command |
|--|--|
| **Linux** | `sudo apt install freeglut3-dev build-essential libsdl2-dev libsdl2-mixer-dev libfreeimage-dev` |
| **macOS** | `brew install freeglut sdl2 sdl2_mixer freeimage` |
| **Windows** | MinGW-w64 + FreeGLUT + SDL2 + SDL2_mixer development libraries |

### 2. Build

```bash
make
```

Or manually compile:
```bash
g++ game.cpp util.cpp -o game -lglut -lGL -lGLU -lX11 -lfreeimage -pthread $(sdl2-config --libs) -lSDL2_mixer -std=c++17 -Wall
```

### 3. Run

```bash
./game
```

---

## 🕹️ Controls

| Input | Action |
|--|--|
| **Arrow Keys** | Move player car (up/down/left/right) |
| **T / t** | Switch to Taxi mode |
| **D / d** | Switch to Courier/Delivery mode |
| **R / r** | Restart game |
| **+** | Increase speed |
| **-** | Decrease speed |
| **B / b** | Boost (costs 10 fuel) |
| **Space** | Stop movement |
| **Mouse Move** | Hover over buttons |
| **Mouse Click** | Interact with UI buttons |
| **ESC** | Exit game |

---

## 📁 File Tree

```
Rush-Hour-Game/
├── game.cpp              ← main game logic & classes
├── util.cpp              ← utility functions
├── util.h                ← utility headers & colors
├── CImg.h                ← image processing library
├── Makefile              ← build configuration
├── leaderboard.dat       ← binary leaderboard (auto-created)
├── install-libraries.sh  ← dependency installer
└── README.md             ← this file
```

---

## 🎮 Gameplay Mechanics

### Objective
Score **100 points or more** within **180 seconds (3 minutes)** to complete the mission.

### Game States

**Taxi Mode (T)** 🚕
- Pick up passengers at cyan colored locations
- Drop them off at dynamically assigned magenta locations
- Gain 10 points per pickup + 30 points per dropoff
- Earn bonus points for fast deliveries (up to +20 points)

**Courier Mode (K)** 📦
- Collect packages from pickup points
- Deliver to green delivery destinations
- Gain 15 points per delivery
- Earn money for each successful delivery

### Core Mechanics

1. **Fuel System**  
   - Start with 100 fuel
   - Decreases with movement (1 per step)
   - Speed increases consumption
   - Refuel at orange fuel stations

2. **Scoring**  
   - Pickup: +10 points (Taxi) or varies per task
   - Dropoff: +30 points (Taxi) or +15 points (Courier)
   - Bonus: Speed-based bonus if delivered fast
   - Mission complete: 100+ points = WIN

3. **Time Pressure**  
   - 180-second countdown
   - Game over when timer hits 0
   - Time penalty if running out of fuel

4. **Fuel Stations**  
   - Regenerate fuel to 100
   - Have 10-second cooldown after use
   - Display as orange squares

---

## 🛠️ Configuration Constants

Edit **top of `game.cpp`** to tweak:

| Constant | Default | Meaning |
|--|--|--|
| `GRID_SIZE` | 20 | cell size in pixels |
| `SCREEN_WIDTH` | 800 | game window width |
| `SCREEN_HEIGHT` | 600 | game window height |
| `MAX_PASSENGERS` | 3 | concurrent passengers |
| `MAX_FUEL_STATIONS` | 2 | fuel stations on map |
| `MAX_DELIVERIES` | 3 | delivery points |
| `timer` (initial) | 180 | mission duration (seconds) |
| `FPS` | 80 | frames per second |

---

## 🏗️ Class Architecture

### Core Classes

**Position**
- Manages 2D coordinates
- Provides distance calculation
- Bounds checking utilities

**Car (Base Class)**
- Common vehicle properties (fuel, speed, score, money)
- Audio initialization (pickup/delivery sounds)
- Movement logic
- Task completion checking

**PlayerCar (Derived Class)**
- Player-controlled vehicle
- Keyboard input handling
- Boost mechanics
- Role-based drawing (Taxi vs Courier)

**Passenger**
- Pickup/dropoff tracking
- Bonus score calculation
- Rendering as cyan squares

**DeliveryPoint**
- Delivery destination tracking
- Timer management
- Rendering as green squares

**FuelStation**
- Fuel availability management
- Cooldown system
- Rendering as orange squares

**Leaderboard**
- Saves scores to binary file
- Displays top 5 scores
- Supports 100+ score entries

**Button**
- Interactive UI elements
- Hover detection
- Click handling

**Game**
- Main game controller
- Entity management
- Collision detection
- HUD rendering

---

## 🎨 Graphics & Rendering

### Color Scheme
- **Taxi Car**: Yellow rectangle with black wheels
- **Courier Car**: Blue rectangle with gray cabin + black wheels
- **Passengers**: Cyan squares
- **Delivery Points**: Green squares (bright when available, darker when delivered)
- **Fuel Stations**: Orange/yellow squares (bright when available, dimmed on cooldown)
- **Dropoff Zone**: Magenta square (Taxi mode only)

### HUD Display
- **Top Status Bar**: Fuel, Score, Time, Money, Current Mode
- **Leaderboard**: Triggered on game over, shows top 5 scores
- **Game Over Message**: Displays reason (fuel/time/win)

---

## 🔊 Audio System

- **SDL2 Mixer** integration for sound effects
- **Pickup Sound**: Plays when collecting a passenger/package
- **Delivery Sound**: Plays when completing a delivery
- Currently loads from system paths (configurable)

---

## 🧪 Extending the Game

| Idea | How |
|--|--|
| **Difficulty Levels** | Reduce timer or increase distance |
| **Obstacles** | Add collision with walls or other cars |
| **Traffic** | Implement NPC cars that block paths |
| **Upgrades** | Add fuel tank capacity increase |
| **Achievements** | Track mission statistics |
| **Custom Maps** | Load level data from files |
| **Multiplayer** | Split-screen or network gameplay |

---

## 🐛 Known Limitations

- **Audio paths hardcoded** → needs update for different systems  
- **Single player only** → no multiplayer modes  
- **Grid-based movement** → no smooth pathfinding  
- **Leaderboard local only** → no cloud sync  
- **No collision with obstacles** → free movement everywhere  
- **Random entity placement** → entities can overlap  

---

## 🔧 Troubleshooting

| Issue | Solution |
|--|--|
| **SDL2 errors on compile** | Install SDL2 dev libraries: `sudo apt install libsdl2-dev libsdl2-mixer-dev` |
| **Audio not working** | Check audio file paths in `game.cpp` line 262 & 266 |
| **Game runs slow** | Reduce FPS constant or lower complexity |
| **Leaderboard empty** | First time? Leaderboard auto-creates on game over |
| **Compilation fails** | Ensure all dependencies installed, check Makefile LDFLAGS |
| **Window won't open** | Verify GLUT installation: `sudo apt install freeglut3-dev` |

---

## 📝 Author

**Abdul Azeem Hashmi**  
Object-Oriented Programming Project | BAI-2A Batch | 24i-2013

---

## 📄 License

This project is provided as-is for educational purposes.
