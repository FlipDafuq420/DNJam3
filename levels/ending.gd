extends Node2D

@export var comic = false
var current_page = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if comic:
		current_page = 1;
		$Comic/Comic1.show()
		$Comic/Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if current_page == 7:
		get_tree().change_scene_to_file("res://levels/menu.tscn")
		pass
	else:
		get_node("Comic/Comic" + str(current_page)).show()
		$Comic/Timer.start()
		current_page += 1
