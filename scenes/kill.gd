extends Area2D
func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		body.set_physics_process(false)
		get_tree().reload_current_scene()
