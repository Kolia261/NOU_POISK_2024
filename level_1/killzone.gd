extends Area2D

#@export var scoreatt: Label
@onready var scoreatt: Label = $"../attemps/Label"


func _ready():
	set_score(Global.restart_count)

func set_score(n):
	var txt = "Attemps : %d" % Global.restart_count
	scoreatt.text = txt
	print(txt)
	

func _on_body_entered(body):
	$"../Dead".play()
	if body == $"../Player":
		Global.restart_count += 1
		set_score(Global.restart_count)
		get_tree().reload_current_scene()
