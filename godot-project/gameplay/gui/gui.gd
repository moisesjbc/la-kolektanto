extends Node


func update_sell_label(quantity: int, type: String, money: int) -> void:
	$control/margin_container/bottom_container/sell_label.text = "Sell " + str(quantity) + " " + type + " for " + str(money) + " €"

func update_score_label(score: int) -> void:
	$control/margin_container/top_container/score_label.text = "Money: " + str(score)

func _on_player_collectibles_updated(quantity: int, type: String, money: int) -> void:
	update_sell_label(quantity, type, money)

func _on_player_money_updated(money: int) -> void:
	update_score_label(money)
