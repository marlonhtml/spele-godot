extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Kaut kas pieskārās pistolei: ", body.name)

	if body.team == "player":
		print("Spēlētājs paņēma pistoli!")
		body.current_weapon = "pistol"
		queue_free()
