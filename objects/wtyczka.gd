extends Area2D

var interact_source
var reachable = false
var held_item = null
var near_player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.get_action_strength("Interact") and near_player != null and held_item != null:
		held_item.near_insert = false
		held_item.locked = true
		held_item.locked_source = near_player
		held_item = null
	if event.get_action_strength("Interact") and reachable:
		held_item = interact_source
		held_item.locked = true
		held_item.locked_source = $"."
		reachable = false

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print_debug(area)
	if area.get_parent().name == "Tabliczka":
		interact_source = area.get_parent()
		interact_source.near_insert = true
		reachable = true


func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	area.get_parent().near_insert = false
	interact_source = null
	reachable = false


func _on_body_entered(body: Node2D) -> void:
	print_debug("grnuydiefiguedrffger")
	if held_item == null:
		pass
	if body.name == "Player":
		near_player = body


func _on_body_exited(body: Node2D) -> void:
	near_player = null
