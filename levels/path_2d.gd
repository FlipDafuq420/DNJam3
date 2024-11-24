extends Path2D

@export_node_path("Area2D") var slot1Path
@export_node_path("Area2D") var slot2Path
@export_node_path("Area2D") var slot3Path

var activated1 = false
var activated2 = false
var activated3 = false

@onready var slot1 = get_node(slot1Path)
@onready var slot2 = get_node(slot2Path)
@onready var slot3 = get_node(slot3Path)

var open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if open:
		$PathFollow2D.progress_ratio += 0.5 * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	activated1 = slot1.activated
	activated2 = slot2.activated
	activated3 = slot3.activated
	
	if activated1 and activated2 and activated3:
		open = true
