extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var initialPos: Vector2
var offset: Vector2
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
				initialPos = global_position
				offset = get_global_mouse_position() - global_position
				global.is_dragging = true
		if Input.is_action_pressed("click"):
				global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
				global.is_dragging = false
				var tween = get_tree().create_tween()
				if is_inside_dropable:
					tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
				else:
					tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)	

func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	if not global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)
	# Replace with function body.


func _on_area_2d_mouse_shape_exited(shape_idx: int) -> void:
	if not global.is_dragging:
		draggable = false
		scale = Vector2(1,1)
	 # Replace with function body.


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body# Replace with function body.


func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
	#pass # Replace with function body.