extends Area2D

var reachable = false
var locked = false
var locked_source
var interact_source
@export var tablet_type = "default"

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

func _input(event):
	if event.get_action_strength("Interact") and reachable and !locked and interact_source != null:
		locked = true
		locked_source = interact_source
	elif event.get_action_strength("Interact") and locked:
		locked = false;
		locked_source = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if locked:
		var locked_position = locked_source.position
		locked_position.y -= 25
		position = locked_position
		
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		interact_source = body
		reachable = true

func _on_body_exited(body: Node2D) -> void:
	interact_source = null
	reachable = false
