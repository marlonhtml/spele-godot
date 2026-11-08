extends CharacterBody2D

@export var controller = 0
@onready var healthbar = "res://scenes/healthbar/healthbar.tscn"

@export var tags = ["character", "important"]
@export var team = "player"

var enemy_target = null

#0 health, 1 energy, 2 shields
@export var hp = 10.0
@export var hp_max = 100.0

@export var effects = {
	"alive": -1.0,
	"immobile": 0.0,
	"attacking": 0.0,
	"controlled": 0.0,
	"downed": 0.0
}

@export var speed = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if controller != 0: GlobalControl.get_input()

	look_at(get_global_mouse_position())

	if velocity.length() > 10:
		$AnimatedSprite2D.play("walk_unarmed")
	else:
		$AnimatedSprite2D.play("idle")

	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	if Input.is_action_just_pressed("Esc"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

	move_and_slide()
