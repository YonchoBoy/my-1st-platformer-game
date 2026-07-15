extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print("-1 HP")
	body.HP -= 1
	body.velocity.y = -950
	body.velocity.x = -500
