extends Area2D

var speed : int = 2500
var direction : Vector2

func _ready() -> void:
	$BulletLifeTimer.start()
	rotation = direction.angle()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += speed * direction * delta
	pass


func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	queue_free()
