extends Path2D

@export var loop = true
@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
@export var speed = 10
@export var speed_scale = 0.8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !loop:
		animation.play("move")
		animation.speed_scale = speed_scale
		set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	path.progress += speed
