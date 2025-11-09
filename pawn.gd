extends Area2D

@export var pawn_color: Color = Color.YELLOW
@export var cell_size: int = 60

var dragging = false
var drag_offset = Vector2.ZERO

func _ready():
	# Update the visual based on the color
	$ColorRect.color = pawn_color
	# Enable input events
	input_pickable = true

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Start dragging
			dragging = true
			drag_offset = position - get_global_mouse_position()
		else:
			# Stop dragging and snap to grid
			dragging = false
			snap_to_grid()

func _process(delta):
	if dragging:
		# Follow the mouse
		position = get_global_mouse_position() + drag_offset

func snap_to_grid():
	# Snap the pawn to the nearest grid cell center
	var grid_x = round(position.x / cell_size)
	var grid_y = round(position.y / cell_size)
	position = Vector2(grid_x * cell_size, grid_y * cell_size)

func set_grid_position(grid_x: int, grid_y: int):
	position = Vector2(grid_x * cell_size, grid_y * cell_size)
