extends Node
var triggered = false

func _physics_process(delta: float) -> void:
	if triggered: 
		if $Square2.position.x < 840:
			$Square2.position.x+=delta*650
		
func _on_trigger_body_entered(body: Node2D) -> void:
	$Square2.show()
	body.triggered = true
	triggered = true
