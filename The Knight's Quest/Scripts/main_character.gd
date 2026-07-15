extends CharacterBody2D



#The Constants.
#Constants is a variable that never changes
const SPEED = 500.0
const JUMP_VELOCITY = -700.0

#The Variables.
#Variables is you can make it true, false, numbers it can change.
var Jump_Count = 0
var HP = 3

#This will add Gravity if we are not on the floor.
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if HP <= 0:
		print("You Died!")
		get_tree().reload_current_scene()		
	# This handles our jump and our double jump.
	if Input.is_action_just_pressed("Jump") and Jump_Count == 1:
		velocity.y = JUMP_VELOCITY
		Jump_Count = 2
		
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Jump_Count = 1
		
	if !Input.is_action_just_pressed("Jump") and is_on_floor():
		Jump_Count = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#This flips the player if the direction changes we use math.
	if direction < 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
		
	#This is the animation script we also use math here.
	if velocity.x != 0:
		$Sprite2D.play("Running")
	else:
		$Sprite2D.play("Idle")

	move_and_slide()
