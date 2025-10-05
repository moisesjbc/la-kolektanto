extends Control


func start(current_score: int) -> void:
	get_tree().paused = true
	visible = true
	$center_container/panel/margin_container/vbox_container/score.text = "Score: " + str(current_score)
	if current_score > get_node("/root/stats").highest_score:
		get_node("/root/stats").save_highest_score(current_score)
	$center_container/panel/margin_container/vbox_container/highest_score.text = "Highest score: " + str(get_node("/root/stats").highest_score)
	$game_over.play()

func restart_game() -> void:
	unpause()
	get_tree().reload_current_scene()

func main_menu() -> void:
	unpause()
	get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")

func unpause() -> void:
	visible = false
	get_tree().paused = false

func _on_restart_game_button_pressed() -> void:
	restart_game()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_R:
		restart_game()

func _on_main_menu_button_pressed() -> void:
	main_menu()
