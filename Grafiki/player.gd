extends CharacterBody2D

@export var speed = 100
@export var gravity = 200
@export var jump_power = -100

func _physics_process(delta: float):
	
	velocity.y += gravity * delta
	
	horizontal_movement()
	
	move_and_slide()

func _input(event):
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power;

func horizontal_movement():
	
	var horizontal_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	velocity.x = horizontal_input * speed
