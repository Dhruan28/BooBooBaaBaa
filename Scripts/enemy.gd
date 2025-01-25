extends CharacterBody2D

var speed = 100
var player_follow = false
var player = null

func _physics_process(delta: float) -> void:
	if player_follow:
		position += (player.position - position) / speed

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_follow = true
	player = body

func _on_detection_area_body_exited(body: Node2D) -> void:
	player_follow = false
	player = null
