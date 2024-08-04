extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
var chase = false
var speed = 1000
var damage = 1 

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var player = $"../Player"
	var direction = (player.global_position - self.global_position).normalized()
	if chase == true:
		sprite.play("idle")
		velocity.x = direction.x * speed * delta
	else:
		velocity.x = 0
		
	move_and_slide()
	
func _on_detector_body_entered(body):
	if body.name == "Player":
		chase = true
		sprite.play("")


func _on_detector_body_exited(body):
	if body.name == "Player":
		chase = false
