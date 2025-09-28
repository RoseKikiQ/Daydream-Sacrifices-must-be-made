extends CharacterBody2D
const b = 50
@onready var triangle: CharacterBody2D = $"../Triangle"
var Body_in_slot = false
var moving_randomly = false


func _physics_process(delta: float) -> void:
	if not moving_randomly:
		var vec_to_triangle = position - triangle.position
		print(vec_to_triangle)
		vec_to_triangle = vec_to_triangle.normalized()
		position = triangle.position + (vec_to_triangle * 80)
	
	if position.x < b:
		position.x = b
		velocity.x = abs(velocity.x)
	if position.y < b:
		position.y = b
		velocity.y = abs(velocity.y)
	if position.y > 600:
		position.y = 600
		velocity.y = -abs(velocity.y)
	if position.x > 1100:
		position.x = 1100
		velocity.x = -abs(velocity.x)
	
	move_and_slide()

func pick_random_direction():
	#var random_angle: float = randf_range(0, TAU) # TAU is 2 * PI, for a full circle
	#velocity = Vector2(sin(random_angle), cos(random_angle)) * 1000.0
	var vec_to_triangle = position - triangle.position
	velocity = vec_to_triangle.normalized() * 1000.0
		
func _on_body_entered(body: Node2D) -> void:
	if body.name=="Triangle":
		body.body_collected = true
	if body.Body_in_slot == true:
			velocity = Vector2.ZERO
