extends Area2D





func _on_body_entered(body: Node2D) -> void:
	print("+10 COINS!")
	queue_free()
