extends Node2D

const GRID_SIZE = 10
const CELL_SIZE = 60  # pixels per cell

var pawn_scene = preload("res://pawn.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	queue_redraw()
	spawn_pawns()

# Draw the grid
func _draw():
	var grid_color = Color(0.3, 0.3, 0.3)
	var line_width = 2.0

	# Draw vertical lines
	for i in range(GRID_SIZE + 1):
		var x = i * CELL_SIZE
		draw_line(Vector2(x, 0), Vector2(x, GRID_SIZE * CELL_SIZE), grid_color, line_width)

	# Draw horizontal lines
	for i in range(GRID_SIZE + 1):
		var y = i * CELL_SIZE
		draw_line(Vector2(0, y), Vector2(GRID_SIZE * CELL_SIZE, y), grid_color, line_width)

func spawn_pawns():
	# Define pawn colors and starting positions
	var pawn_data = [
		{"color": Color.YELLOW, "grid_pos": Vector2(1, 1)},
		{"color": Color.ORANGE, "grid_pos": Vector2(8, 1)},
		{"color": Color.PURPLE, "grid_pos": Vector2(1, 8)},
		{"color": Color.GREEN, "grid_pos": Vector2(8, 8)}
	]

	for data in pawn_data:
		var pawn = pawn_scene.instantiate()
		pawn.pawn_color = data.color
		pawn.cell_size = CELL_SIZE
		add_child(pawn)
		pawn.set_grid_position(data.grid_pos.x, data.grid_pos.y)
