extends Node2D

@export var bullet_scene : PackedScene

func _ready() -> void:
	get_parent().get_node("TestAirish").shoot.connect(_on_player_shoot)

func _on_player_shoot(bullet_position, bullet_direction):
	var bullet = bullet_scene.instantiate()
	bullet.direction = bullet_direction
	bullet.team = "player"
	
	add_child(bullet)
	bullet.global_position = bullet_position
