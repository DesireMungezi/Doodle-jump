extends Camera2D
export(NodePath) var player_path
var Player

# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node(player_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var player_y = Player.position.y
	#var camera_y = clamp(player_y, 0, get_viewport_rect().size.y)
	if player_y < position.y:
		position = Vector2(position.x, player_y)
