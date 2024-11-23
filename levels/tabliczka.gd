extends Area2D

var reachable = false
var locked = false
var locked_source
var interact_source

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

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
		position = locked_source.position
	
func _on_body_entered(body: Node2D) -> void:
	interact_source = body
	reachable = true

func _on_body_exited(body: Node2D) -> void:
	interact_source = null
	reachable = false
