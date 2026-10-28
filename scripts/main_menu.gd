extends Node2D

var button_type = null

func _on_exit_pressed() -> void:
	button_type = "exit"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_play_pressed() -> void:
	button_type = "play"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


func _on_fade_timer_timeout() -> void:
	if button_type == "play":
		get_tree().change_scene_to_file("res://scenes/levels.tscn")
	if button_type == "exit":
		get_tree().quit()
		
		
