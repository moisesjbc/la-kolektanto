extends Node

signal sell_button_pressed

func _ready():
	reset()
	
func reset():
	update_sell_label(0, "???", 0)
	update_score_label(0)
	update_time_label(60)

func update_sell_label(quantity: int, type: String, money: int) -> void:
	$control/bottom_container/hbox_container/sell_button/label.text = "Sell " + str(quantity) + " = " + str(money) + " €"
	for collectible_sprite in $collectible_type_sprite.get_children():
		collectible_sprite.visible = collectible_sprite.name == type

func update_score_label(score: int) -> void:
	$control/score_label.text = str(score) + " €"
	
func update_time_label(seconds_left: int) -> void:
	$control/time_label.text = str(seconds_left / 60) + ":%02d" % (seconds_left % 60)

func _on_player_collectibles_updated(quantity: int, type: String, money: int) -> void:
	update_sell_label(quantity, type, money)

func _on_player_money_updated(money: int) -> void:
	update_score_label(money)

func _on_main_time_elapsed(seconds_left: int) -> void:
	update_time_label(seconds_left)

func _on_main_game_over() -> void:
	update_time_label(0)
	$game_over.start()

func left_button_pressed() -> bool:
	return $control/bottom_container/hbox_container/left_button.button_pressed
	
func right_button_pressed() -> bool:
	return $control/bottom_container/hbox_container/right_button.button_pressed

func _on_sell_button_pressed() -> void:
	emit_signal("sell_button_pressed")

func _on_pause_button_pressed() -> void:
	# Don't pause on tutorial
	if get_node("/root/main"):
		if not get_tree().paused:
			if not $game_over.visible:
				$pause_menu.pause()
		else:
			$pause_menu.unpause()
