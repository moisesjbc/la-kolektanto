extends Node

func _ready():
	update_sell_label(0, "???", 0)
	update_score_label(0)
	update_time_label(get_parent().seconds_left)

func update_sell_label(quantity: int, type: String, money: int) -> void:
	$control/sell_label.text = "Sell " + str(quantity) + " for " + str(money) + " €"
	for collectible_sprite in $collectible_type_sprite.get_children():
		collectible_sprite.visible = collectible_sprite.name == type

func update_score_label(score: int) -> void:
	$control/margin_container/top_container/score_label.text = "Money: " + str(score)
	
func update_time_label(seconds_left: int) -> void:
	$control/margin_container/top_container/time_label.text = "Time: " + str(seconds_left)

func _on_player_collectibles_updated(quantity: int, type: String, money: int) -> void:
	update_sell_label(quantity, type, money)

func _on_player_money_updated(money: int) -> void:
	update_score_label(money)

func _on_main_time_elapsed(seconds_left: int) -> void:
	update_time_label(seconds_left)

func _on_main_game_over() -> void:
	update_time_label(0)
	$game_over.start()
