extends Sprite2D

var killed = false

func _on_body_entered(body: Node2D) -> void:
	print("Collided, body collected ", body.Body_collected)
	if body.name=="Circle":
		print(body.body_collected)
	if body.Body_collected == true:
		body.in_slot()


func _on_circleslot_body_entered(body: Node2D) -> void:
	print("Collided, body collected ", body.Body_collected)
	if body.name=="Circle":
		print(body.Body_collected)
	if killed and body.name == "Circle":
		body.in_slot()
