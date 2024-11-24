extends Area2D

@export_file("*.tscn") var next_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(_body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file", next_level)
