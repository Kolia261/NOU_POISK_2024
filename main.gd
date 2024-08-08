extends Node2D

var score = 0
@onready var coins = $coins
@onready var scoretext = $CanvasLayer/Label
@onready var keys = $keys
@onready var scorekeys = $key/Label
@onready var sprite = $door/AnimatedSprite2D
@onready var dialog = $dialog/Label
var score_dialog = 0

func _ready():
	Globs.score_keys = 0
	for coin in coins.get_children():
		if coin is Coin:
			coin.picked_up.connect(_on_coin_picked_up)
	for key in keys.get_children():
		if key is Key:
			key.picked_ups.connect(_on_coin_picked_up_coin)
func _on_coin_picked_up():
	score += 1
	Glob.grusha_score += 1
	print("Glob_Grusha", Glob.grusha_score)
	scoretext.text = "SCORE : %d" % score
	if score == 13:
		OS.alert('MONEY', 'Ты собрал все груши. Молодец! Ищи ключ от двери')
		dialog.text = "Аноним: \n Молодец! А теперь ищи ключ! \n За груши ты можешь купить оружие! \n P.s Магазин оружия в меню"
		
func _on_coin_picked_up_coin():
	Globs.score_keys += 1
	scorekeys.text = "Keys : %d" % Globs.score_keys
	dialog.text = "Мысли: \n Кажется это тот самый ключ \n о котором говорил аноним. \n Интересно от чего же он?"

func _on_button_pressed():
	if Globs.score_keys >= 1:
		sprite.play("open")
		OS.alert('Успешно! Доступ разрешен', 'True')
		get_tree().change_scene_to_file("res://home.tscn")
	else:
		OS.alert('У вас нет ключа! Найдите ключ!', 'False')

func _process(delta):
	if Input.is_action_just_pressed("skip_dialog"):		
		score_dialog += 1
		print(score_dialog)
	if score_dialog == 1:
		dialog.text = "Сосед: В этот раз тебе от меня не убежать! \n Ты надоел уже всей округе! \n Постоянно лазишь по нашим домам! \n  На этот раз тебе конец!"
	if score_dialog == 2:
		dialog.text = "Внутренний голос:  \n Кажется незнакомец рассказывал что-то про \n груши и ключи... \n Наверное нужно искать ключ."
