extends Node2D

var daytime = "day"
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_time()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
