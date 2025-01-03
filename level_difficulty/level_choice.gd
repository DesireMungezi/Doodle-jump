extends Control


func _ready():
	pass


func _on_level_three_pressed():
	get_tree().change_scene("res://levels/level_three.tscn")


func _on_level_two_pressed():
	get_tree().change_scene("res://levels/level_two.tscn")


func _on_level_one_pressed():
	get_tree().change_scene("res://levels/level_one.tscn")
