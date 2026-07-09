extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print("YOU DIED!")
	get_tree().reload_current_scene()
	
