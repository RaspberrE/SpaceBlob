extends CharacterBody2D

@export var walk_speed = 150.0
@export var run_speed = 500.0
@export_range(0,1) var deceleration =0.1
@export_range(0,1) var acceleration =0.1
@export var jump_force = -400
@export_range(0,1) var decelerate_on_jump_release = 0.5

func _physics_process(delta: float) -> void:
	
	if Globalvars.slime_form == "bunny":
		$StickmanCollision.set_deferred("disabled",true)
		$BunnyCollision.set_deferred("disabled", false) ########### This code disables the collision or enables
		
	if Globalvars.slime_form == "stickman":
		$StickmanCollision.set_deferred("disabled",false)
		$BunnyCollision.set_deferred("disabled", true)
	
	var direction := Input.get_axis("Left", "Right")
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.

	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			velocity.y = jump_force
		elif Globalvars.no_grav == true or(is_on_wall() and Globalvars.slime_form == "stickman"):
			velocity.y = jump_force
		

	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed("SlimeMenu"):
		$Camera2D/CanvasLayer/BlobSpendMenu.visible = true
	
	var speed 
	if Input.is_action_pressed("Run") and Globalvars.slime_form=="stickman":
		speed = run_speed
	else:
		speed = walk_speed
	
	if direction == 1:
		$Sprite2D.flip_h = true
	elif direction == -1:
		$Sprite2D.flip_h = false 
	
	if direction:
		velocity.x = move_toward(velocity.x, direction*speed, speed * acceleration) #move toward changes the velocity.x of the char by the third value, until is reaches the second value, making the charachter move from the 0 velocity to the velocity with direction gradually (ts applies acceleration ofc)
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)
		
	move_and_slide()
