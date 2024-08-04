extends Node2D

var score = 0
@onready var coins = $coins
@onready var scoretext = $CanvasLayer/Label

func _ready():
	for coin in coins.get_children():
		if coin is Coin:
			coin.picked_up.connect(_on_coin_picked_up)
			
func _on_coin_picked_up():
	score += 1
	scoretext.text = "SCORE : %d" % score
