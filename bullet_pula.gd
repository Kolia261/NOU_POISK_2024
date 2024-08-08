extends Area2D

var speed = 300

var damage = 1
@onready var texts = $"../text/Label"
	

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	print(body.name)
	if body.name == "Naighbor":
		GlobHeal.count_he1 -= damage
		texts.text = "Осталось жизней у соседа 1 : %d" % GlobHeal.count_he1
		print(GlobHeal.count_he1)
		if GlobHeal.count_he1 <= 0:
			body.queue_free()
	if body.name == "neighbor_2":
		GlobHeal.count_he2 -= damage
		texts.text = "Осталось жизней у соседа 2 : %d" % GlobHeal.count_he2
		print(GlobHeal.count_he2)
		if GlobHeal.count_he2 <= 0:
			body.queue_free()
	if body.name == "Maman":
			body.queue_free()
	if body.name == "Granny":
		body.queue_free()
		print(4)
	queue_free()
