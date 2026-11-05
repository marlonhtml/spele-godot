extends Node

var player_body = null

func change_controller(body):
	if player_body != null:
		player_body.controller = 0
		player_body.effects["controlled"] = 0
	player_body = body
	body.controller = 1
	body.effects["controlled"] = -1

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	player_body.velocity = input_direction * player_body.speed



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
