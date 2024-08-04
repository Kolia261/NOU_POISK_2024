extends Node2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
@onready var scorehealth = $"../health/Label"
var chase = false
var speed = 70
var damage = 1
var min_chase = false

func _ready():
	Globals.count_healf = 5
	scorehealth.text = "Lives  : %d" % Globals.count_healf

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
	var player = $"../Player"
	var direction = (player.global_position - self.global_position).normalized()
	
	if min_chase == true:
		sprite.play("Death")
	elif chase == true:
		sprite.play("idle")
		position.x += direction.x * speed * delta
	
	#move_and_slide()
	
func _on_detector_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_detector_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_min_detector_body_entered(body):
	print(body.name)
	if body.name == "Player":
		Globals.count_healf -= damage
		scorehealth.text = "Lives  : %d" % Globals.count_healf
		min_chase = true
		if Globals.count_healf == 0:
			Global.restart_count += 1
			get_tree().reload_current_scene()
		
func _on_min_detector_body_exited(body):
	if body.name == "Player":
		min_chase = false
