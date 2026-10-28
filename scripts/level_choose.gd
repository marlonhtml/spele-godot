extends Node2D

var button_type = null

func _on_mission_1_pressed() -> void:
	button_type = "mission1"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_mission_2_pressed() -> void:
	button_type = "mission2"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_return_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _on_fade_timer_timeout() -> void:
	if button_type == "mission1":
		get_tree().change_scene_to_file("res://scenes/level1.tscn")
	if button_type == "mission2":
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
