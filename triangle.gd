extends CharacterBody2D
var jumping = false
const MARGIN = 50

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * 500
	move_and_slide()
	
	if Input.is_action_just_pressed("Jump") and not jumping:
		jumping  = true
		await get_tree().create_timer(0.5).timeout
		jumping = false
	if jumping:
		$Icon.scale+=Vector2(delta,delta)
		$Icon.scale = $Icon.scale.clamp(Vector2(1,1), Vector2(1.5, 1.5))
	if not jumping:
		$Icon.scale-=Vector2(delta,delta)
		$Icon.scale = $Icon.scale.clamp(Vector2(1,1), Vector2(1.5, 1.5))
	if position.x < MARGIN:
		position.x = MARGIN
	if position.y < MARGIN:
		position.y = MARGIN
	if position.y > 600:
		position.y = 600
	if position.x > 1100:
		position.x = 1100
