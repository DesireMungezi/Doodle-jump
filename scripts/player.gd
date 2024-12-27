extends RigidBody2D
export var speed: int = 400
export(NodePath) var camera_path
var camera
var direction:Vector2
var jump_speed = 500
var width
var height

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_node(camera_path)
	width = get_viewport_rect().size.x
	#Reduce the height a little
	height = get_viewport_rect().size.y
	pass # Replace with function body.
func _physics_process(_delta):
	var left_key = Input.is_action_pressed("left")
	var right_key = Input.is_action_pressed("right")
	
	if left_key:
		linear_velocity = Vector2(-speed, linear_velocity.y)
		$Sprite.flip_h = true
	if right_key:
		linear_velocity = Vector2(speed, linear_velocity.y)
		$Sprite.flip_h = false
	if !left_key and !right_key:
		linear_velocity = Vector2(0, linear_velocity.y)
	#This is a wrap functon
	screen_wrap()
	#Check if the player has died
	if position.y > height:
		print(position.y , height)
		died()

#This function is used to wrap or teleport the player to the other side
func screen_wrap():
	if position.x > width:
		position.x = 0
	if position.x < 0:
		position.x = width
	#position.x = wrapf(position.x, 0, width)
func died():
	get_tree().reload_current_scene()

func collision(body):
	if body.is_in_group('paddles') and linear_velocity.y > 0:
		linear_velocity = Vector2(0, -jump_speed)

func _on_VisibilityNotifier2D_screen_exited():
	# Get the viewport size
	var viewport_size = get_viewport().size
	
	# Teleport the player to the opposite side of the screen
	if position.x < 0:
		position.x = viewport_size.x
	elif position.x > viewport_size.x:
		position.x = 0
	
	if position.y < 0:
		position.y = viewport_size.y
	elif position.y > viewport_size.y:
		position.y = 0
