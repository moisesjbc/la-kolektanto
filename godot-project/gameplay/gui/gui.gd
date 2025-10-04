extends Node


func update_sell_text(quantity: int, type: String, money: int) -> void:
	$control/margin_container/vbox_container/sell_text.text = "Sell " + str(quantity) + " " + type + " for " + str(money) + " €"


func _on_player_collectibles_updated(quantity: int, type: String, money: int) -> void:
	update_sell_text(quantity, type, money)
