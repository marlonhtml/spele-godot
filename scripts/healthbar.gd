extends ProgressBar

@onready var timer = $Timer
@onready var damage_bar = $Damagebar

var health = 0 : set = _set_health

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
	damage_bar.value = health
