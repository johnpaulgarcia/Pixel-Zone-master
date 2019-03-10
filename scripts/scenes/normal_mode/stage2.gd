extends Node
func _ready():
	get_node("/root/game_level").points += 1



func _on_Area2D_body_entered(body):
	if body.name =="player":
		get_tree().change_scene("scenes/normal_mode/stage3_boss.tscn")



func _on_Area2D2_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("scenes/GameOver.tscn")
