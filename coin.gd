class_name Coin

extends Node2D

signal picked_up

func _on_area_2d_body_entered(body):
	print('+1')
	picked_up.emit()
	Glob.grusha_score += 1
	queue_free()