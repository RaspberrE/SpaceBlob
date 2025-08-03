extends CharacterBody2D

@export var walk_speed = 150.0
@export var run_speed = 500.0
@export_range(0,1) var deceleration =0.1
@export_range(0,1) var acceleration =0.1
@export var jump_force = -400
@export_range(0,1) var decelerate_on_jump_release = 0.5

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.

	if Input.is_action_just_pressed("Jump") and(is_on_floor() or is_on_wall()):
		velocity.y = jump_force

	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var speed 
	if Input.is_action_pressed("Run"):
		speed = run_speed
	else:
		speed = walk_speed
	
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = move_toward(velocity.x, direction*speed, speed * acceleration) #move toward changes the velocity.x of the char by the third value, until is reaches the second value, making the charachter move from the 0 velocity to the velocity with direction gradually (ts applies acceleration ofc)
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)

	move_and_slide()
