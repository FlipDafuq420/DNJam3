extends Node2D

var daytime = "day"
@onready var player = $Player
@export var daytime_mechanic = false
@export var moving_mechanic = false
@export var movableNodes: Array[Node2D] = []

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position = $StartPoint.get_node("pos").global_position
	if daytime_mechanic:
		change_time()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Player.game_over:
		get_tree().reload_current_scene()
		
func change_time():
	if daytime == "day":
		$Noc.hide()
		$Dzien.show()
		player.set_collision_layer_value(9, true)
		player.set_collision_mask_value(9, true)
		player.set_collision_layer_value(10, false)
		player.set_collision_mask_value(10, false)
	if daytime == "night":
		$Dzien.hide()
		$Noc.show()
		player.set_collision_layer_value(10, true)
		player.set_collision_mask_value(10, true)
		player.set_collision_layer_value(9, false)
		player.set_collision_mask_value(9, false)
		
func toggle_moving(state: bool):
	for movable in movableNodes:
		movable.stop = state
		
func _input(event: InputEvent) -> void:
	if event.get_action_strength("Quit"):
		get_tree().quit()
