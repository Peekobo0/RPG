extends CharacterBody2D

var speed := 44
var player_chase := false
var player = null
@onready
var animation_player := $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if player_chase == true:
		position += (player.position - position) / speed
		animation_player.play("walk")
		if (player.position.x - position.x) < 0:
			animation_player.flip_h = true
		else:
			animation_player.flip_h = false
	else:
		animation_player.play("idle")

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true

func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
