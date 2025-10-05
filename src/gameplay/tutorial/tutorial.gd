extends Node

var current_step_index: int = 0
var current_step: Node = null
var seconds_left = 90

func _ready() -> void:
	set_step(0)

func set_step(new_step_index: int) -> void:
	if current_step:
		current_step.visible = false

	current_step_index = new_step_index
	current_step = $steps.get_child(current_step_index)
	current_step.visible = true
	$gui.reset()
	if current_step.has_method("setup"):
		current_step.setup()
	$tutorial_gui/margin_container/panel/margin_container/vbox_container/instructions_label.text = current_step.text
	
	if current_step.get_node("panel_pos"):
		$tutorial_gui/margin_container.global_position.y = current_step.get_node("panel_pos").global_position.y
	
	if current_step_index == 0:
		$tutorial_gui/margin_container/panel/margin_container/vbox_container/bottom_bar/previous_button.text = "Main menu"
	else:
		$tutorial_gui/margin_container/panel/margin_container/vbox_container/bottom_bar/previous_button.text = "<"
		
	if current_step_index == ($steps.get_child_count() - 1):
		$tutorial_gui/margin_container/panel/margin_container/vbox_container/bottom_bar/next_button.text = "Main menu"
	else:
		$tutorial_gui/margin_container/panel/margin_container/vbox_container/bottom_bar/next_button.text = ">"

func _on_previous_button_pressed() -> void:
	if current_step_index == 0:
		get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")
	else:
		set_step(current_step_index - 1)

func _on_next_button_pressed() -> void:
	if current_step_index == ($steps.get_child_count() - 1):
		get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")
	else:
		set_step(current_step_index + 1)
