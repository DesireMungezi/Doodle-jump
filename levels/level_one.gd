extends Node2D
#This number is the amount of platforms to generate
export var total_platform_number: int
onready var audio_stream_player_2d = $AudioStreamPlayer2D

#These below are references of the types of platforms
var Normal_platform:PackedScene = preload("res://scenes/paddle.tscn")
var Bounce_platform = preload("res://bounce platform/bounce_paddle.tscn")
var Break_platform = preload("res://Break platform/break_platform.tscn")
var First_monster = preload("res://Monsters/monster.tscn")

var width
onready var platform_initial_position_y = $paddles/paddle.position.y
onready var score_label = $Camera2D/score_label as Label
onready var camera_2d = $Camera2D as Camera2D
onready var camera_position = $Camera2D.position.y
var score:int = 0


# Called when the node enters the scene tree for the first time.
func generate_platforms(amount):
	width = get_viewport_rect().size.x
	randomize()
	
	for items in amount:
		#The close the numbers are, the close the platforms will be spawned together
		platform_initial_position_y -= round(rand_range(20, 60))
		var normal_platform = Normal_platform.instance() as StaticBody2D
		var break_platform = Break_platform.instance() as RigidBody2D
		
		
		#This if statement helps use to choose at random what platform to spawn
		#Here 70% of the time it will be normal platforms to be spawned
		var paddles_position: Vector2
		if randf() <= 0.7:
			#45 and 350 are position on the x-axis that determine where the platform will be spawned
			paddles_position = Vector2(round(rand_range(45, 350)), platform_initial_position_y)
			normal_platform.position = paddles_position
			$paddles.add_child(normal_platform)
		else:
			#Here 30% of the time it will be bounce and break platforms spawned 50/50 each
			if randf() <= 0.4 and break_platform.position.y - break_platform.position.y < 100:
				break_platform.position = Vector2(round(rand_range(45, 350)), platform_initial_position_y)
				$paddles.add_child(break_platform)

func _ready():
	audio_stream_player_2d.play()
	generate_platforms(total_platform_number)
	
	#This code is used to center the window screen when the game starts
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_real_window_size()
	
	var window_position = (screen_size - window_size) / 2
	OS.set_window_position(window_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Update the score every flame
	
	update_score()

#This code helps us to delete platforms and use a little ram in the process
func _on_platform_deleter_body_entered(body):
	body.queue_free()

func update_score():
	#This 50 number can be used for level score
	#Like a lower number for easy level and higher number for hard levels
	score = int(camera_position - camera_2d.position.y) / 50
	score_label.text = str(int(score))

