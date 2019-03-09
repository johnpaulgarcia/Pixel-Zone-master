extends Control
func _ready():
	get_node("/root/game_level").points == 0
	get_node("/root/game_level_no_enemies").points == 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_tree().change_scene("scenes/MainMenu.tscn")
