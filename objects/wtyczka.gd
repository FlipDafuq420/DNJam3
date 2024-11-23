extends Area2D

var interact_source
var reachable = false
var held_item

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.get_action_strength("Interact") and reachable:
		held_item = interact_source
		held_item.locked = true
		held_item.locked_source = $"."


func _on_body_entered(body: Node2D) -> void:
	if body.name == "tabliczka":
		interact_source = body
		interact_source.near_insert = true
		reachable = true


func _on_body_exited(body: Node2D) -> void:
	body.near_insert = false
	interact_source = null
	reachable = false
