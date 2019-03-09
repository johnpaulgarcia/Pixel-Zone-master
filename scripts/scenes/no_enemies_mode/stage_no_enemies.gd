extends Node
func _ready():
	get_node("/root/game_level_no_enemies").points += 1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D2_body_entered(body):
	get_tree().change_scene("scenes/GameOver.tscn")


func _on_Area2D_body_entered(body):
	get_tree().change_scene("scenes/stages/no_enemies_mode/stage2_no_enemies.tscn")
