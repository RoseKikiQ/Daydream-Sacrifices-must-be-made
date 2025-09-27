extends CharacterBody2D
const b = 50
@onready var triangle: CharacterBody2D = $"../Triangle"

func _physics_process(delta: float) -> void:
	var vec_to_triangle = position - triangle.position
	print(vec_to_triangle)
	vec_to_triangle = vec_to_triangle.normalized()
	position = triangle.position + (vec_to_triangle * 80)
	
	if position.x < b:
		position.x = b
	if position.y < b:
		position.y = b
	if position.y > 600:
		position.y = 600
	if position.x > 1100:
		position.x = 1100
