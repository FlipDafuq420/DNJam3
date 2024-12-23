extends Area2D

var interact_source
var reachable = false
var held_item = null
var near_player = null
@export_group("Finale")
@export var finale = false
@export var correct_tablet = ""
var activated = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.get_action_strength("Interact") and near_player != null and held_item != null:
		held_item.near_insert = false
		held_item.sprite.animation = held_item.tablet_type
		held_item.locked = true
		held_item.inserted = false
		held_item.locked_source = near_player
		taken_out()
		held_item = null
	if event.get_action_strength("Interact") and reachable:
		held_item = interact_source
		held_item.locked = true
		held_item.inserted = true
		%Player.holding = false
		held_item.locked_source = $"."
		held_item.sprite.animation = "in_" + held_item.tablet_type
		reachable = false
		inserted()

func _on_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	if area.get_parent().name.begins_with("Tabliczka"):
		interact_source = area.get_parent()
		interact_source.near_insert = true
		reachable = true


func _on_area_shape_exited(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	area.get_parent().near_insert = false
	interact_source = null
	reachable = false


func _on_body_entered(body: Node2D) -> void:
	if held_item == null:
		pass
	if body.name == "Player":
		near_player = body


func _on_body_exited(_body: Node2D) -> void:
	near_player = null
	
func inserted():
	if finale and held_item.tablet_type == correct_tablet:
		activated = true
		pass
	match held_item.tablet_type:
		"slonce":
			get_tree().current_scene.daytime = "night"
			get_tree().current_scene.change_time()
		"nie":
			get_tree().current_scene.toggle_moving(true)
		"ruch":
			get_tree().current_scene.toggle_moving(true)
			print("AAAAAAAAAAAAaa")
	
func taken_out():
	match held_item.tablet_type:
		"slonce":
			get_tree().current_scene.daytime = "day"
			get_tree().current_scene.change_time()
		"nie":
			get_tree().current_scene.toggle_moving(false)
		"ruch":
			get_tree().current_scene.toggle_moving(false)
			print("BBBBBBBBBBB")
