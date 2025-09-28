extends Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Circle":
		print(body.body_collected)
	if body.Body_collected == true:
		Body_in_slot == true
