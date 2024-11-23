extends CharacterBody2D

@export var speed = 100
@export var gravity = 200
@export var jump_power = -100
var game_over = false
var face = "default"
var moving = false

func _physics_process(delta: float):
	
	velocity.y += gravity * delta
	
	horizontal_movement()
	
	if !is_on_floor():
		$AnimatedSprite2D.animation = "Jump"
	if is_on_floor() and velocity.x != 0:
		$AnimatedSprite2D.animation = "Walk_Right"
	if is_on_floor() and velocity.x == 0:
		$AnimatedSprite2D.animation = "Face_Right"

	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = 0
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = 1
	
	move_and_slide()

func _input(event):
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power;

func horizontal_movement():
	
	var horizontal_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	velocity.x = horizontal_input * speed

func kill():
	hide()
	game_over = true
