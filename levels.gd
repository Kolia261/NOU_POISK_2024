extends Node2D

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://level_2.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://menushka.tscn")
