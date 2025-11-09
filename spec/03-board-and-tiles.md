# Game Board and Tile System

## Board Structure

### Grid-Based Layout
- Each tile is composed of a grid (typically 4x4 or 5x5 spaces)
- Tiles connect orthogonally (N/S/E/W)
- Modular design allows dynamic board creation

### Starting Configuration
- Begin with 1 starting tile
- All 4 characters start on designated starting spaces
- Initial objectives visible on starting tile or immediately adjacent

## Tile System

### Tile Types

#### Color-Coded Tiles
Tiles are organized by color to control exploration:

- **Orange tiles**: General shopping areas
- **Purple tiles**: Special zones
- **Green tiles**: Alternative paths
- **Yellow tiles**: Exit areas

### Tile Components

Each tile contains:
1. **Grid spaces**: Walkable floor tiles
2. **Walls**: Impassable barriers (gray/black)
3. **Explore markers**: Colored magnifying glass icons indicating where new tiles attach
4. **Special spaces**: Escalators, vortexes, hourglasses
5. **Objective markers**: Shop locations (weapon, armor, magic, accessory)

### Tile Placement Rules

1. New tile must connect to existing tile at explore marker
2. Tile color must match explore marker color
3. Openings must align (paths connect, walls don't block)
4. Tile orientation may be rotated to fit
5. Some tiles have fixed orientations (indicated by arrows)

## Special Spaces

### Explore Markers
- **Visual**: Magnifying glass icon
- **Color**: Orange, purple, green, or yellow
- **Function**: Indicates where and what color tile can be placed
- **Activation**: Character stands on marker, player with Explore action places matching tile

### Hourglass Tokens
- **Visual**: Hourglass icon
- **Function**: Flip the sand timer when character reaches it
- **One-time use**: Token is removed after use
- **Strategic importance**: Critical for time management

### Vortex Portals
- **Visual**: Swirling portal graphic
- **Colors**: Multiple colors (orange, purple, etc.)
- **Function**: Teleport to any other vortex of same color
- **Requires**: Player with Vortex action

### Escalators
- **Visual**: Escalator graphic with direction arrow
- **Function**: Move between mall floors/sections
- **Connection**: Each escalator connects to specific other escalator
- **Requires**: Player with Escalator action

### Security Gates
- **Visual**: Transparent barrier or red line
- **Function**: Blocks passage until specific condition met
- **Types**:
  - Time-based (opens after certain time)
  - Objective-based (opens when character gets their item)
  - Alarm-based (related to specific scenarios)

## Objective Locations

### Shop Types
Four item shops characters must visit:

1. **Weapon Shop** (Barbarian's objective)
   - Icon: Sword or axe
   - Color: Red/orange marker

2. **Armor Shop** (Dwarf's objective)
   - Icon: Shield or helmet
   - Color: Gray/silver marker

3. **Magic Shop** (Mage's objective)
   - Icon: Wand or spell book
   - Color: Purple/blue marker

4. **Accessory Shop** (Elf's objective)
   - Icon: Bow or quiver
   - Color: Green marker

### Exit
- **Visual**: Yellow square with exit arrow
- **Final objective**: All characters must reach this
- **Location**: Typically on outer tiles, requires exploration

## Dynamic Board State

### Progressive Revelation
- Board starts small (1 tile)
- Expands as players explore
- Maximum board size varies by scenario
- Typical full board: 9-24 tiles

### Board Memory
- Track which tiles have been placed
- Track which hourglass tokens have been used
- Track which objectives have been completed
- Track character positions

## Visual Design Requirements

### Clarity Needed
- Clear indication of walls vs open spaces
- Obvious connection points between tiles
- Distinct icons for different objective types
- Visual feedback for special spaces

### Color Coding
- Consistent color scheme across tiles
- Objective markers use character-specific colors
- Explore markers clearly show their color
- Accessibility considerations (colorblind modes)

### Animation
- Tile placement animation
- Character movement smooth but fast
- Visual effects for special actions (vortex teleport, escalator use)
- Timer visualization

## Scenario Variations

Different scenarios modify board rules:

### Scenario 1 (Tutorial)
- Simple board, few tiles
- All objectives easily reachable
- Extra hourglass tokens

### Advanced Scenarios
- More tiles required
- Complex layouts
- Fewer hourglass tokens
- Additional constraints (alarms, security systems)
- Special win conditions

### Digital Implementation
- Store scenarios as JSON/data files
- Define starting tile, tile pool, objectives, special rules
- Easy to create custom scenarios
