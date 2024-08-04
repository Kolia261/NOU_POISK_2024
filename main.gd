extends Node2D

var score = 0
@onready var coins = $coins
@onready var scoretext = $CanvasLayer/Label
@onready var keys = $keys
@onready var scorekeys = $key/Label
@onready var sprite = $door/AnimatedSprite2D
func _ready():
	Globs.score_keys = 1
	for coin in coins.get_children():
		if coin is Coin:
			coin.picked_up.connect(_on_coin_picked_up)
	for key in keys.get_children():
		if key is Key:
			key.picked_ups.connect(_on_coin_picked_up_coin)
func _on_coin_picked_up():
	score += 1
	scoretext.text = "SCORE : %d" % score
	if score == 14:
		OS.alert('MONEY', 'Ты собрал все мотки. Молодец! Ищи ключ от двери')

func _on_coin_picked_up_coin():
	Globs.score_keys += 1
	scorekeys.text = "Keys : %d" % Globs.score_keys


func _on_button_pressed():
	if Globs.score_keys >= 1:
		sprite.play("open")
		OS.alert('Успешно! Доступ разрешен', 'True')
		get_tree().change_scene_to_file("res://home.tscn")
	else:
		OS.alert('У вас нет ключа! Найдите ключ!', 'False')
