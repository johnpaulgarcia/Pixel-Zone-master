extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# Called when the node enters the scene tree for the first time.
func save():
    var save_dict = {
        "filename" : get_filename(),
        "parent" : get_parent().get_path(),
        "coins_points" : get_node("/root/game_state").points,
        "killed_enemies_points" : get_node("/root/killed_enemies").points,
        "experience_points" : get_node("/root/game_experience").points,
		"pos_x" : get_position().x,
		"pos_y" : get_position().y
    }
    return save_dict
