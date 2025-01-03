extends Control

func _ready():
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_restart_pressed():
	get_tree().change_scene("res://level_difficulty/level_choice.tscn")
