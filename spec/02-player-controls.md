# Player Controls and Movement System

## Action Distribution

Each player is assigned one or more action types that they can perform on ANY character. The standard distribution is:

### Standard 4-Player Setup
- **Player 1**: North movement
- **Player 2**: South movement
- **Player 3**: East movement
- **Player 4**: West movement

### With Special Actions
- **Explore**: Reveal new tiles (when character is on an explore space)
- **Escalator**: Use escalators to move between floors
- **Vortex**: Teleport between vortex portals

### Variable Player Count Distribution

#### 1 Player (Solo)
- Controls all actions

#### 2 Players
- Split actions evenly (e.g., Player 1: N/E/Explore, Player 2: S/W/Escalator/Vortex)

#### 3 Players
- Each gets 1-2 cardinal directions plus special actions

#### 5-8 Players
- Actions are distributed more granularly
- Some players may have single actions
- Special actions distributed separately

## Movement Rules

### Basic Movement
- Characters move one orthogonal space (N/S/E/W) per action
- Cannot move diagonally
- Cannot move through walls or barriers
- Can move through other characters
- Multiple characters can occupy the same space

### Colored Spaces
- **Orange circles**: Objectives (weapon, armor, magic, accessory shops)
- **Yellow square**: Exit (final objective)
- **Hourglass tokens**: Flip the timer when reached
- **Explore markers**: Reveal new tile when character is on them

### Walls and Barriers
- Gray walls block movement
- Transparent barriers (security gates) require specific conditions
- Some walls have colored timer markings (time extensions)

## Special Actions

### Explore Action
1. Character must be on an explore marker (magnifying glass icon)
2. Player with "Explore" action places a new tile from the stack
3. Tile must match the color of the explore marker
4. Opens new areas of the mall

### Escalator Action
1. Character must be on an escalator space
2. Player with "Escalator" action moves character to connected escalator
3. Connects different floors/areas of the mall

### Vortex Action
1. Character must be on a vortex portal
2. Player with "Vortex" action teleports character to any other vortex of same color
3. Allows fast travel across the board

## "Do Something" Pawn

### Purpose
Silent communication tool when players need to signal urgency

### Rules
1. Any player can place the pawn in front of another player
2. Cannot be used to communicate specific information
3. Can only be placed once it has been returned by the previous recipient
4. Should be implemented as a clickable action in online version

### Digital Implementation
- Button/icon available to each player
- Can send "Do Something" signal to specific player
- Visual indicator shows who sent it
- Cooldown timer prevents spam

## Input Controls (Godot Implementation)

### Mouse/Touch Controls
- Click/tap on character to select
- Click/tap on adjacent valid space to move
- Highlight valid moves based on player's available actions

### Keyboard Controls (Optional)
- Arrow keys for directional movement
- Number keys 1-4 to select characters
- Space bar to confirm action
- E for Explore, S for Escalator, V for Vortex

### Controller Support (Optional)
- D-pad/joystick for movement
- Face buttons for character selection
- Shoulder buttons for special actions

## Turn Structure

### Important: No Turns!
- Magic Maze is fully real-time
- Players can act simultaneously
- No turn order or waiting
- Actions resolve immediately

### Action Validation
- System checks if player has permission for action
- System checks if move is legal (no walls, valid space)
- If valid, movement executes immediately
- Visual feedback for invalid attempts

## Action Restrictions

### Cannot Do List
- Cannot move characters with actions not assigned to you
- Cannot move through walls
- Cannot use special actions without the proper token
- Cannot communicate verbally (must be enforced through game design)

### Action Queuing
- Actions should execute immediately (real-time)
- No queuing system - if two players try to move same character, one succeeds first
- Network latency must be handled gracefully
