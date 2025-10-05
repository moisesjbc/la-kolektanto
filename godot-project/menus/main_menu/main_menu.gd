extends Control


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://gameplay/main/main.tscn")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/credits_menu/credits_menu.tscn")
