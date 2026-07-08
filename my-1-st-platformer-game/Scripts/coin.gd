extends Area2D





func _on_body_entered(body: Node2D) -> void:
	print("You collected 10 coins!")
	queue_free()
