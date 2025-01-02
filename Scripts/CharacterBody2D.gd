extends CharacterBody2D

const maxSpeed = 300
const accel = 1500
const friction = 600

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
func player_movement(delta):
	input = get_input()
		
	if input == Vector2.ZERO:
		if velocity.length() > (friction + delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input*delta*accel)
		velocity = velocity.limit_length(maxSpeed)

	move_and_slide()
