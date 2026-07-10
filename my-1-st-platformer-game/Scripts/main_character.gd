extends CharacterBody2D

#The Constants.
const SPEED = 400.0
const JUMP_VELOCITY = -700.0

#The Variables.
var Jump_Count = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

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

	move_and_slide()
