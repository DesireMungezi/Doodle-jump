extends RigidBody2D
var fall_speed:= 300
onready var animated_sprite = $AnimatedSprite


func _ready():
	pass

func monster_fall():
	linear_velocity.y += fall_speed
