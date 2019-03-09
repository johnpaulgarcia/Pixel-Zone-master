extends ViewportContainer


func _ready():
	settings.connect("window_size_changed", self, "_on_window_size_changed")

func _on_window_size_changed(prev, now):
	rect_size = now
	$Viewport.size = now
func save():
    var save_dict = {
        "filename" : get_filename(),
        "parent" : get_parent().get_path(),
        "coins_points" : get_node("/root/game_state").points,
        "killed_enemies_points" : get_node("/root/killed_enemies").points,
        "experience_points" : get_node("/root/game_experience").points,
		"pos_x" : get_position().x,
		"pos_y" : get_position().y,
    }
    return save_dict