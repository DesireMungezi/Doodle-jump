extends Node2D
#This number is the amount of platforms to generate
export var total_platform_number: int
var platform:PackedScene = preload("res://scenes/paddle.tscn")
var width
onready var platform_initial_position_y = $paddles/paddle.position.y

# Called when the node enters the scene tree for the first time.
func generate_platforms(amount):
	width = get_viewport_rect().size.x
	randomize()
	
	for items in amount:
		#The close the numbers are, the close the platforms will be spawned together
		platform_initial_position_y -= round(rand_range(50, 150))
		print(platform_initial_position_y)
		var new_platform = platform.instance() as StaticBody2D
		#45 and 350 are position on the x-axis that determine where the platform will be spawned
		new_platform.position = Vector2(round(rand_range(45, 350)), platform_initial_position_y)
		$paddles.add_child(new_platform)
func _ready():
	generate_platforms(total_platform_number)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#This code helps us to delete platforms and use a little ram in the process
func _on_platform_deleter_body_entered(body):
	body.queue_free()
