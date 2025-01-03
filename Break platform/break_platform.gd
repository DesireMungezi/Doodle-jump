extends RigidBody2D
onready var animated_sprite = $AnimatedSprite
var speed:= 200
var gravity_enabled = false

func _ready():
	gravity_scale = 0
	
func _physics_process(_delta):
	if gravity_enabled:
		detected_fall()

func detected_fall()->void:
	#This function makes the platform to fall when the player lands on it
	linear_velocity.y += speed
	animated_sprite.play("break")
	gravity_enabled = false
