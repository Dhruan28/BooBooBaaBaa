extends CharacterBody2D

var SPEED = 200
var curDir = "none"
var dashUse = 2

func _physics_process(delta):
	player_movement(delta)
	
	if Input.is_action_just_pressed("dash") and dashUse > 0:
		dash()
		dashUse = dashUse - 1
		

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
	var x = 0
	if dir == "right":
		x = 0
	if dir == "left":
		anim.flip_h = true
		x = 1
	if movement != 0:
		if x == 0:
			anim.flip_h = false
			anim.play("run")
		if x == 1:
			anim.flip_h = true
			anim.play("run")
	else:
		anim.play("idle")
			

			
func dash():
	SPEED = SPEED *4
	$Timer.start()
	
	

func _on_timer_timeout():
	SPEED = 200
	
