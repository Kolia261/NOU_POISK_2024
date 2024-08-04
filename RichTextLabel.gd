extends RichTextLabel

var dialog = ["Hey! My name is Benjamin"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	


func _on_ready():
	pass # Replace with function body.
