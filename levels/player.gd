extends CharacterBody2D

@export var speed = 100
@export var gravity = 200
@export var jump_power = -100
var face = "default"
var moving = false

func _ready() -> void:
	$AnimatedSprite2D.autoplay

func _physics_process(delta: float):
	
	velocity.y += gravity * delta
	
	horizontal_movement()
	
	if velocity.x > 0:
		$AnimatedSprite2D.animation = "Walk_Right"
		face = "right"
	if velocity.x < 0:
		$AnimatedSprite2D.animation = "Walk_Left"
		face = "left"
	if velocity.x == 0 and face == "left":
		$AnimatedSprite2D.animation = "Face_Left"
	if velocity.x == 0 and face == "right":
		$AnimatedSprite2D.animation = "Face_Right"
	
	move_and_slide()

func _input(event):
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power;
	#if event.is_action_pressed("move_left") or event.is_action_pressed("move_right"):
		#if moving:
			#match face:
				#"right":
					#$AnimatedSprite2D.animation = "Walk_Right"
				#"left":
					#$AnimatedSprite2D.animation = "Walk_Left"
				#"default":
					#$AnimatedSprite2D.animation = "default"
		#else:
			#match face:
				#"right":
					#$AnimatedSprite2D.animation = "Face_Right"
				#"left":
					#$AnimatedSprite2D.animation = "Face_Left"
				#"default":
					#$AnimatedSprite2D.animation = "default"

func horizontal_movement():
	
	var horizontal_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	velocity.x = horizontal_input * speed

func kill():
	get_tree().reload_current_scene()
