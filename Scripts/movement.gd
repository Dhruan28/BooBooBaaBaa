extends CharacterBody2D

const SPEED = 200
var curDir = "none"

func _physics_process(delta):
	player_movement(delta)

	# Get the input direction and handle the movement/deceleration.
func player_movement(delta):
	if Input.is_action_pressed("ui_up"):
		playerAnim(1)
		curDir = "up"
		velocity.x = 0
		velocity.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		playerAnim(1)
		curDir = "down"
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_action_pressed("ui_right"):
		playerAnim(1)
		curDir = "right"
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		playerAnim(1)
		curDir = "left"
		velocity.x = -SPEED
		velocity.y = 0
	else:
		playerAnim(0)
		velocity.x =0
		velocity.y = 0

	move_and_slide()
func playerAnim(movement):
	var dir = curDir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("run")
		elif movement == 0:
			anim.play("idle")
			
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("run")
		elif movement == 0:
			anim.play("idle")
