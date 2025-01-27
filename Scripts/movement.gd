extends CharacterBody2D

var speed = 200
var curDir = "none"
var lastDir = "right"
var dashUse = 2
var input = Vector2.ZERO


func _physics_process(delta: float) -> void:
	player_movement(delta)
	
	if Input.is_action_just_pressed("dash") and dashUse > 0:
		dash()
		dashUse = dashUse - 1

# Get the input direction and handle the movement/deceleration.
func get_input():
	input.x = int(Input.is_action_pressed("player_right")) - int(Input.is_action_pressed("player_left"))
	input.y = int(Input.is_action_pressed("player_down")) - int(Input.is_action_pressed("player_up"))
	return input.normalized()

	
func player_movement(delta):
	input = get_input()
	velocity = input * speed
	
	if velocity == Vector2.ZERO:
		playerAnim(0)
	else:
		if velocity.x > 0:
			playerAnim(1)
			curDir = "up"
		elif velocity.x < 0:
			playerAnim(1)
			curDir = "down"
		if velocity.x > 0:
			playerAnim(1)
			curDir = "right"
			lastDir = "right"
		elif velocity.x < 0:
			playerAnim(1)
			curDir = "left"
			lastDir = "left"
		
	# makes the player move... DO NOT REMOVE
	move_and_slide()


func playerAnim(movement):
	var anim = $AnimatedSprite2D

	if movement != 0:
		if lastDir == "right":
			anim.flip_h = false
			anim.play("run")
		if lastDir == "left":
			anim.flip_h = true
			anim.play("run")
	else:
		anim.play("idle")

# dash functionality
func dash():
	speed = speed *4
	$Timer.start()


func _on_timer_timeout():
	speed = 200
	
