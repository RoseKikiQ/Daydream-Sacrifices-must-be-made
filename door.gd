extends Area2D
var Body_in_slot = false
@export var level: int
func _on_body_entered(body: Node2D) -> void:
	if body.name=="Triangle":
		print(body.Key_collected)
		print(level)
		if body.Key_collected == true:
			if level == 0:
				get_tree().change_scene_to_file("res://level2.tscn")
			elif level == 1:
				get_tree().change_scene_to_file("res://Level3.tscn")
			elif level == 2:
				get_tree().change_scene_to_file("res://Level4.tscn")
	if body.Body_in_slot == true:
		if level == 3:
			get_tree(). change_scene_to_file("res://level5.tscn")
		else:
			print("not has key")
