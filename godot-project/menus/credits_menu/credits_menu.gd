extends Control


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")


func _on_credits_text_meta_clicked(meta: Variant) -> void:
	OS.shell_open(meta)
