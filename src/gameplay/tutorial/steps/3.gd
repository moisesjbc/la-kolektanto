extends Node2D


var text: String = 'Collect many items of the same type to get bonus points\n(First item is worth 1€, second item is worth 2€, etc)'

func setup() -> void:
	get_node("/root/tutorial/gui").update_sell_label(3, 'coin', 6)
