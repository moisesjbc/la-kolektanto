extends Control


func _ready() -> void:
	$margin_container/vbox_container/exit_button.visible = (OS.get_name() != "Web")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://gameplay/main/main.tscn")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/credits_menu/credits_menu.tscn")

func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://gameplay/tutorial/tutorial.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()
