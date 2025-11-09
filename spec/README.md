# Magic Maze - Game Specification

This folder contains comprehensive specifications for recreating Magic Maze as an online multiplayer game using Godot.

## Overview

Magic Maze is a real-time cooperative board game where players work together to help four fantasy characters navigate through a shopping mall, complete objectives, and escape before time runs out. The unique twist: each player controls specific actions (like moving North) for ALL characters, rather than controlling individual characters.

## Specification Documents

### [01 - Game Overview](01-game-overview.md)
Core concept, gameplay loop, unique mechanics, and win/lose conditions. Start here to understand what Magic Maze is and how it plays.

**Key Topics**:
- Split control system (each player controls one type of action for all characters)
- Silent cooperation mechanic
- Real-time pressure with timer
- Victory and failure conditions
- Player count support (1-8 players)

### [02 - Player Controls](02-player-controls.md)
Detailed specification of how players interact with the game, what actions they can perform, and input handling.

**Key Topics**:
- Action distribution by player count
- Movement rules and restrictions
- Special actions (Explore, Escalator, Vortex)
- "Do Something" pawn for communication
- Input controls for different platforms
- Real-time action system (no turns)

### [03 - Board and Tiles](03-board-and-tiles.md)
Complete specification of the game board, tile system, and special spaces.

**Key Topics**:
- Grid-based tile layout
- Tile types and color coding
- Special spaces (explore markers, hourglasses, vortexes, escalators)
- Objective locations (shops and exit)
- Dynamic board expansion
- Godot implementation considerations

### [04 - Multiplayer Networking](04-multiplayer-networking.md)
Network architecture, synchronization, and online multiplayer implementation.

**Key Topics**:
- Server-client architecture (authoritative server)
- Network message protocols
- Game state synchronization
- Latency handling and client-side prediction
- Lobby and matchmaking systems
- Timer synchronization
- Action distribution in multiplayer

### [05 - UI/UX](05-ui-ux.md)
Complete user interface and user experience specification.

**Key Topics**:
- Main menu and lobby interfaces
- In-game HUD (timer, objectives, player actions)
- Game board view and camera controls
- Visual feedback for actions
- Communication features (respecting no-talking rule)
- Accessibility features
- Game end screens

### [06 - Game Rules and Scenarios](06-game-rules-scenarios.md)
Comprehensive game rules, scenarios with varying difficulty, and game modes.

**Key Topics**:
- Complete rule set
- Movement and action rules
- Win/loss conditions
- Scenario system (6 base scenarios + custom)
- Difficulty scaling
- Action distribution formulas for different player counts
- Additional game modes (competitive, campaign, daily challenge)

### [07 - Technical Architecture](07-technical-architecture.md)
Technical implementation details, data structures, and system architecture.

**Key Topics**:
- Technology stack (Godot 4.x, ENet networking)
- Project structure
- Core data structures (Character, Tile, GameState, Board)
- Network architecture (server/client implementation)
- Manager systems (ActionManager, ScenarioManager)
- Global events system
- Performance optimization
- Testing and deployment

## Implementation Roadmap

### Phase 1: Core Game Mechanics
1. Basic tile and grid system
2. Character representation and movement
3. Game state management
4. Action validation
5. Timer system

### Phase 2: Game Rules
1. Objective system
2. Special actions (explore, escalator, vortex)
3. Win/loss conditions
4. Scenario loading
5. Hourglass mechanics

### Phase 3: Single Player
1. Solo mode (all actions to one player)
2. Basic UI
3. Tutorial scenario
4. Win/loss screens

### Phase 4: Local Multiplayer
1. Action distribution system
2. Multiple input handling
3. Player identification
4. Do Something pawn

### Phase 5: Online Multiplayer
1. Server implementation
2. Client implementation
3. Lobby system
4. Game state synchronization
5. Latency handling

### Phase 6: Polish
1. Visual effects and animations
2. Sound effects and music
3. Enhanced UI/UX
4. Accessibility features
5. Additional scenarios

### Phase 7: Extended Features
1. Ranked/competitive modes
2. Custom scenario editor
3. Achievements and progression
4. Replays and spectating
5. Mobile support

## Key Design Principles

### 1. Cooperative Focus
The game is fundamentally cooperative. All mechanics should encourage teamwork and coordination without verbal communication.

### 2. Time Pressure
Real-time gameplay with constant timer creates tension and forces quick decisions. This must be balanced carefully to be challenging but not frustrating.

### 3. Split Control Uniqueness
The split control system (players control action types, not characters) is the core innovation. Implementation must make this clear and intuitive.

### 4. Network Reliability
Online multiplayer requires robust networking with proper validation, synchronization, and graceful handling of lag/disconnects.

### 5. Accessibility
Game should be playable by diverse audiences with different abilities, including colorblind modes and clear visual feedback.

## Technical Requirements

### Minimum System Requirements
- **CPU**: Dual-core 2.0 GHz
- **RAM**: 2 GB
- **GPU**: OpenGL 3.3 compatible
- **Storage**: 200 MB
- **Network**: Broadband internet for online play

### Recommended System Requirements
- **CPU**: Quad-core 2.5 GHz
- **RAM**: 4 GB
- **GPU**: Dedicated graphics card
- **Storage**: 500 MB
- **Network**: Low-latency broadband (<50ms ping)

## Data File Formats

### Scenario Format (JSON)
```json
{
  "id": 1,
  "name": "Tutorial",
  "difficulty": "Easy",
  "description": "Learn the basics of Magic Maze",
  "starting_time": 240,
  "hourglass_count": 3,
  "starting_tile": "tile_01",
  "tile_decks": {
    "orange": ["tile_02", "tile_03", "tile_04"],
    "purple": ["tile_05", "tile_06"],
    "green": ["tile_07", "tile_08"],
    "yellow": ["tile_09"]
  },
  "special_rules": []
}
```

### Tile Format (JSON)
```json
{
  "id": "tile_01",
  "color": "orange",
  "grid_size": {"x": 4, "y": 4},
  "grid_data": [
    [1, 1, 1, 1],
    [1, 0, 0, 1],
    [1, 0, 0, 1],
    [1, 1, 1, 1]
  ],
  "explore_markers": [
    {"position": {"x": 2, "y": 0}, "color": "orange"}
  ],
  "hourglasses": [{"x": 1, "y": 1}],
  "objectives": [
    {"position": {"x": 2, "y": 2}, "type": "weapon"}
  ]
}
```

## References

### Original Game
- **Publisher**: Sit Down! Games
- **Designers**: Kasper Lapp, Jesper Bülow
- **Year**: 2017

### Similar Digital Adaptations
Study these for UX/networking best practices:
- Board Game Arena implementations
- Tabletop Simulator mods
- Other real-time cooperative digital board games

### Godot Resources
- [Godot High-Level Multiplayer](https://docs.godotengine.org/en/stable/tutorials/networking/high_level_multiplayer.html)
- [Godot Networking Tutorial](https://docs.godotengine.org/en/stable/tutorials/networking/)
- [Godot Tilemap Documentation](https://docs.godotengine.org/en/stable/tutorials/2d/using_tilemaps.html)

## Contributing to Specifications

These specifications are living documents. As you implement features, you may discover:
- Ambiguities that need clarification
- Technical limitations requiring design changes
- Opportunities for improvement
- Additional features worth specifying

Update these documents as the project evolves to maintain accurate documentation.

## License and Legal

This is a fan recreation for educational purposes. Magic Maze is a registered trademark of Sit Down! Games. This project is not affiliated with or endorsed by the original publishers.

If planning commercial release, consult with legal counsel regarding intellectual property rights.

## Questions or Clarifications

If any specification is unclear or you need additional detail on a particular system, refer to:
1. The original board game rules
2. Related specification documents
3. Godot documentation for implementation details
4. Community forums for multiplayer game development best practices
