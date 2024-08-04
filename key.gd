class_name Key

extends Node2D

signal picked_ups

func _on_area_2d_body_entered(body):
	print('key+1')
	picked_ups.emit()
	queue_free()
