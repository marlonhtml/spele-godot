extends CharacterBody2D

signal shoot(bullet_position, bullet_direction)
var can_shoot : bool
@export var controller = 0
@onready var healthbar = $"../Camera2D/UI/Healthbar"

@export var tags = ["character", "important"]
@export var team = "player"

var enemy_target = null

#0 health, 1 energy, 2 shields
@export var hp = 40.0
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

func _ready() -> void:
	await healthbar.ready
	healthbar.init_health(hp, hp_max)
	can_shoot = true
	

func _physics_process(delta: float) -> void:
	if controller != 0: GlobalControl.get_input()

	look_at(get_global_mouse_position())

	if velocity.length() > 10:
		$AnimatedSprite2D.play("walk_unarmed")
	else:
		$AnimatedSprite2D.play("idle")
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		var dir = (get_global_mouse_position() - global_position).normalized()
		shoot.emit(global_position, dir)
		can_shoot = false
		$ShotTimer.start()
	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()

func take_damage(damage:int):
	hp -= damage
	if hp < 0: hp = 0
	healthbar.change_health(-damage)


func _on_shot_timer_timeout() -> void:
	can_shoot = true
