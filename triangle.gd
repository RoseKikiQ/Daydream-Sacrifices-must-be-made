extends CharacterBody2D
var jumping = false
const b = 50

@export var is_final = false

var triggered = false
var pushing = false
var falling = false

var Key_collected = false
var Has_Key = false
var Not_has_key = true
var Body_collected = false
func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "up", "down")
	if not triggered:
		velocity = input_dir * 500
	else:
		velocity = Vector2(0,0)
	if is_final:
		velocity.y = 0
	move_and_slide()
	
	if Input.is_action_just_pressed("Jump") and not jumping and not triggered:
		jumping  = true
		await get_tree().create_timer(0.5).timeout
		jumping = false
	if jumping:
		$Icon.scale+=Vector2(delta,delta)
		$Icon.scale = $Icon.scale.clamp(Vector2(0.75,0.75), Vector2(1.5, 1.5))
	if not jumping:
		$Icon.scale-=Vector2(delta,delta)
		$Icon.scale = $Icon.scale.clamp(Vector2(0.75,0.75), Vector2(1.5, 1.5))
	if position.x < b:
		position.x = b
	if position.y < b and not is_final:
		position.y = b
	if position.y > 600 and not is_final:
		position.y = 600
	if position.x > 1100:
		position.x = 1100
		
	if pushing:
		position.x += 400*delta
	if falling:
		position.y += 612*delta
	

func _on_area_body_entered(body: Node2D) -> void:
	if triggered:
		pushing = true
		await get_tree().create_timer(0.25).timeout
		falling = true
		await get_tree().create_timer(2.25).timeout
		get_tree().change_scene_to_file("res://level6.tscn")
