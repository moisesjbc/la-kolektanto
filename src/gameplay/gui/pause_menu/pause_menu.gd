extends Control

var game_paused = false

func pause() -> void:
	get_tree().paused = true
	game_paused = true
	visible = true

func unpause() -> void:
	visible = false
	game_paused = false
	get_tree().paused = false

func resume_game() -> void:
	unpause()

func main_menu() -> void:
	unpause()
	get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")

func _on_resume_game_pressed() -> void:
	resume_game()

func _input(event: InputEvent) -> void:
	# Don't pause on tutorial
	if get_node("/root/main") and event is InputEventKey:
		if game_paused and event.keycode == KEY_R:
			resume_game()
		elif not get_tree().paused and event.keycode == KEY_ESCAPE:
			pause()

func _on_main_menu_button_pressed() -> void:
	main_menu()
