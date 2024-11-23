# Queue the current scene to free on the next frame:
var root_node = get_tree().get_root()
var scene_node = root_node.get_node("poziom1n")
scene_node.queue_free()

# Load in some scene from our project files:
var new_scene_resource = load("res://levels/poziom1n.tscn") # Load the new level from disk
var new_scene_node = new_scene_resource.instantiate() # Create an actual node of it for the game to use
root_node.add_child(new_scene_node) # Add to the tree so the level starts processing

get_tree().change_scene_to_file("res://levels/poziom1.tscn")
