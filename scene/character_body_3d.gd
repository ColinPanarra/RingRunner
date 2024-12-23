extends CharacterBody3D


const SPEED = 5.0
#onst gravity = -9.8

func _physics_process(_delta: float) -> void:

	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_down", "move_up")
	var direction := Vector3(input_dir.x, input_dir.y, 0).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	rotate_z(.01)
	move_and_slide()
