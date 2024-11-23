extends RigidBody2D

var drag : bool = false

func _process(delta: float) -> void:
	if drag:
		var current : Vector2 = self.global_position
		var mouse : Vector2 = get_global_mouse_position()
		
		var distance: float = current.distance_to(mouse)
		var direction: Vector2 = current.direction_to(mouse)
		
		var speed : float = distance / delta  
		
		
		var velocity : Vector2 = direction * speed
		move_and_collide(velocity)
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and drag and not event.is_pressed():
		drag = false
	
func _funk(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		drag = event.is_pressed()
