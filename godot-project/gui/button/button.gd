extends Button


func _on_pressed() -> void:
	get_node("/root/sound_manager").play_button_pressed_sound()
