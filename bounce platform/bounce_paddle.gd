extends StaticBody2D
var spring_enabled:= false
onready var animated_sprite = $AnimatedSprite

func _ready():
	pass

func _physics_process(_delta):
	if spring_enabled:
		animated_sprite.play("bounce_spring")
		spring_enabled = false
