extends ProgressBar

@onready var timer = $Timer
@onready var damage_bar = $Damagebar

var health = 0 : set = _set_health
var damage_tween: Tween

func _set_health(new_health):
	var prev_health = health
	health = min(max_value, max(0, new_health))
	value = health

	if health < prev_health:
		timer.start()
	else:
		damage_bar.value = health

func init_health(_health, _max_health):
	max_value = _max_health
	health = _health
	value = health

	damage_bar.max_value = _max_health
	damage_bar.value = health

func _on_timer_timeout() -> void:
	if damage_tween:
		damage_tween.kill()
	damage_tween = create_tween()
	damage_tween.tween_property(damage_bar, "value", health, 0.5)
	damage_tween.set_trans(Tween.TRANS_QUAD)
	damage_tween.set_ease(Tween.EASE_OUT)
	
func change_health(newValue):
	health+=newValue 
