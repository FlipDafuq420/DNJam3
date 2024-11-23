extends Area2D

var extended = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	change_state()
	$Timer.start()
	
func change_state():
	var move_spikes = Vector2()
	if extended:
		move_spikes.y += 7
		extended = false
	else:
		move_spikes.y -= 7
		extended = true
		
	position += move_spikes
	
func _on_body_entered(body: Node2D):
	if body.name == "Player":
		body.kill()
