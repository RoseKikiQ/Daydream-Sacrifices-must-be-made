extends Node

var knife_picked_up = false
var killed = false

func _physics_process(delta: float) -> void:
	if knife_picked_up:
		$Knife.position = $Triangle.position

func _on_knife_body_entered(body: Node2D) -> void:
	if not $Circle.moving_randomly and not killed:
		knife_picked_up = true
		$Circle.moving_randomly = true
		$Circle.pick_random_direction()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() == $Circle and $Circle.moving_randomly:
		$Circle.moving_randomly = false
		$Circle.modulate = Color.RED
		killed = true
