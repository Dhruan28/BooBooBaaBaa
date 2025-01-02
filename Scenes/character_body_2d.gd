extends CharacterBody2D

const speed = 300.0
const _velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	# setting direction vector
	var direction := Vector2(
		# x axis
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		# y axis
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	# setting velocity of object if input vector != 0
	if direction:
		velocity = direction * speed

	move_and_slide()
