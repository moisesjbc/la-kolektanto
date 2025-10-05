extends Node2D

var text: String = 'Press "Sell" button below (or "SPACE" on PC) for selling your current items. The money will be added to your score (top right corner).'

func setup() -> void:
	get_node("/root/tutorial/gui").update_sell_label(0, '???', 0)
	get_node("/root/tutorial/gui").update_score_label(6)
