extends CharacterBody2D

@export var head_color = Color(1, 1, 1)
@export var left_arm_color = Color(1, 1, 1)
@export var left_hand_color = Color(1, 1, 1)
@export var right_arm_color = Color(1, 1, 1)
@export var right_hand_color = Color(1, 1, 1)
@export var leg_color = Color(1, 1, 1)

@export var anim_torso = "default"
@export var anim_head = "default"
@export var anim_hair = "default"
@export var anim_hat = "default"

@export var speed = 300.0
@export var tags = ["character", "important"]
@export var team = "player"

@export var controller = 0
var enemy_target = null

#0 health, 1 energy, 2 shields
@export var hp = 100.0
@export var hp_max = 100.0

@export var effects = {
	"alive": -1.0,
	"immobile": 0.0,
	"attacking": 0.0,
	"controlled": 0.0,
	"downed": 0.0
}
var time_since_damage = 100.0
var attacks = 0


func _ready():
	$UpperBody/Head.self_modulate = head_color
	$UpperBody/RightArm.self_modulate = right_arm_color
	$UpperBody/RightArm/RightHand.self_modulate = right_hand_color
	$UpperBody/LeftArm.self_modulate = left_arm_color
	$UpperBody/LeftArm/LeftHand.self_modulate = left_hand_color
	$Legs.self_modulate = leg_color
	
	$UpperBody/Torso.play(anim_torso)
	$UpperBody/Head.play(anim_head)
	$UpperBody/Head/Hair.play(anim_hair)
	$UpperBody/Head/Hat.play(anim_hat)

func fatal_damage():
	effects["downed"] = -1

func heal_damage(h_amount):
	hp += h_amount
	if hp < 0: hp = 0
	if hp > hp_max: hp = hp_max
	if hp <= 0: fatal_damage()

func take_damage(a_amount, a_kind):
	var layer = 0
	hp -= max(0, (a_amount))
	if hp <= 0: fatal_damage()

func attack(attack_name):
	if get_node("Attack" + str(attack_name)).a_ready and effects["attacking"] == 0:
		get_node("Attack" + str(attack_name)).attack()
		$Sprite/Arms.play(attack_name)

func _physics_process(delta: float)-> void:
	if controller != 0: GlobalControl.get_input()
	if Input.is_action_just_pressed("Esc"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


	move_and_slide()
