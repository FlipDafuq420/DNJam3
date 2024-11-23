extends StaticBody2D

@export var tablet_type = "default"
@export var gravity = 100
var reachable = false
var locked = false
var locked_source
var interact_source
var velocity = Vector2(Vector2.ZERO)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match tablet_type:
		"slonce":
			$AnimatedSprite2D.animation = "slonce"
		"nie":
			$AnimatedSprite2D.animation = "nie"
		"ruch":
			$AnimatedSprite2D.animation = "ruch"
		"default":
			$AnimatedSprite2D.animation = "default"
	velocity.y += gravity

func _input(event):
	if event.get_action_strength("Interact") and reachable and !locked and interact_source != null:
		locked = true
		locked_source = interact_source
	elif event.get_action_strength("Interact") and locked:
		locked = false;
		locked_source = null

func _physics_process(delta: float) -> void:
	if !locked:
		move_and_collide(velocity * delta)

		
func _process(delta: float) -> void:
	if locked:
		var locked_position = locked_source.get_node("HoldPoint").global_position
		position = locked_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		interact_source = body
		reachable = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	interact_source = null
	reachable = false
