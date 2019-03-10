extends Node
#func _ready():
	#get_node("/root/game_level").points += 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.





func _on_Area2D2_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("scenes/GameOver.tscn")
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




func _on_nextlevel_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("scenes/stages/normal_mode/stage2.tscn")