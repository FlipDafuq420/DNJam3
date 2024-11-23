extends Path2D

@export var loop = true
@export var speed = 100
@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
@onready var area2d = $AnimatableBody/Area2D
var extended = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if extended and path.progress_ratio > 0:
		print_debug("a")
		path.progress -= speed * delta
	if !extended and path.progress_ratio < 1:
		print_debug()
		path.progress += speed * delta

func _on_timer_timeout() -> void:
	if extended:
		extended = false
		$Timer.start()
	else:
		extended = true
		$Timer.start()
		



func _on_area_2d_body_entered(body: Node2D) -> void:
	body.kill()
