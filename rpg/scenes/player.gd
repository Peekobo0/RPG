extends CharacterBody2D

const SPEED := 100
var current_direction := "none"

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta: float) -> void:
	player_movement(delta)

func player_movement(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		current_direction = "right"
		play_animation(1)
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y = -SPEED
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0 	
		
	move_and_slide()
	
func play_animation(movement):
	var direction := current_direction
	var animation_player := $AnimatedSprite2D
	
	if direction == "right":
		animation_player.flip_h = false
		if movement == 1:
			animation_player.play("side_walk")
		elif movement == 0:
			animation_player.play('side_idle')
	elif direction == "left":
		animation_player.flip_h = true
		if movement == 1:
			animation_player.play("side_walk")
		elif movement == 0:
			animation_player.play('side_idle')
	elif direction == "down":
		animation_player.flip_h = false
		if movement == 1:
			animation_player.play("front_walk")
		elif movement == 0:
			animation_player.play('front_idle')
	elif direction == "up":
		animation_player.flip_h = false
		if movement == 1:
			animation_player.play("back_walk")
		elif movement == 0:
			animation_player.play('back_idle')
