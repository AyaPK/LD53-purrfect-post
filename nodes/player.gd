extends CharacterBody2D

var MOVE_SPEED = 100
var MAX_SPEED = 100
const ACCELERATION = 100
const FRICTION = 100
const THRESHOLD = 0.01

var last_direction = Vector2.DOWN

@onready var animated_sprite = $AnimatedSprite2D

func player():
	pass

func _physics_process(delta):
	current_camera()
	
	var DOWN_LEFT = Vector2(-1, 1).normalized()
	var DOWN_RIGHT = Vector2(1, 1).normalized()
	var UP_LEFT = Vector2(-1, -1).normalized()
	var UP_RIGHT = Vector2(1, -1).normalized()
	
	# handle input
	var input_direction = Vector2.ZERO 
	if Input.is_action_pressed("ui_shift_pressed"):
		MAX_SPEED = 200
		MOVE_SPEED = 200
	else:
		MAX_SPEED = 100
		MOVE_SPEED = 100
	
	if Dialogic.VAR.dialog_open == "closed":
		if Input.is_action_pressed("ui_right"):
			input_direction.x += 1
		if Input.is_action_pressed("ui_left"):
			input_direction.x -= 1
		if Input.is_action_pressed("ui_down"):
			input_direction.y += 1
		if Input.is_action_pressed("ui_up"):
			input_direction.y -= 1
		
	if input_direction.length() <= THRESHOLD:
		animated_sprite.stop()
		animated_sprite.set_frame(1)

	# normalize input direction if necessary
	if input_direction.length_squared() > 1:
		input_direction = input_direction.normalized()

	# apply acceleration and friction
	var target_velocity = input_direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity, ACCELERATION * delta)
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	# move the player
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity

	# update animation and flip sprite based on movement direction
	if input_direction != Vector2.ZERO:
		last_direction = input_direction

	if last_direction == Vector2.DOWN:
		animated_sprite.play("down")
	elif last_direction == DOWN_LEFT:
		animated_sprite.play("down_left")
	elif last_direction == Vector2.LEFT:
		animated_sprite.play("left")
	elif last_direction == UP_LEFT:
		animated_sprite.play("up_left")
	elif last_direction == Vector2.UP:
		animated_sprite.play("up")
	elif last_direction == UP_RIGHT:
		animated_sprite.play("up_right")
	elif last_direction == Vector2.RIGHT:
		animated_sprite.play("right")
	elif last_direction == DOWN_RIGHT:
		animated_sprite.play("down_right")

func current_camera():
	var cameras = [$world_camera, $post_office_interior_camera, $main_village_camera,
					$cave_interior_camera, $duck_house_interior_camera, $turtle_house_interior_camera,
					$pommy_house_interior_camera]
	
	for camera in cameras:
		camera.enabled = false
	
	if States.current_scene == "world":
		$world_camera.enabled = true
	elif States.current_scene == "post_office_interior":
		$post_office_interior_camera.enabled = true
	elif States.current_scene == "main_village":
		$main_village_camera.enabled = true
	elif States.current_scene == "cave_interior":
		$cave_interior_camera.enabled = true
	elif States.current_scene == "duck_house":
		$duck_house_interior_camera.enabled = true
	elif States.current_scene == "turtle_house":
		$turtle_house_interior_camera.enabled = true
	elif States.current_scene == "pommy_house":
		$pommy_house_interior_camera.enabled = true;
