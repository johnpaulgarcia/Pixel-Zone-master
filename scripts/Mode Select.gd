extends Control
func _process(delta):
	if $CheckButton.pressed == true:
		$RichTextLabel.show()
	if $CheckButton.pressed == false:
		$RichTextLabel.hide()
		
func _on_Normal_mode_pressed():
	get_tree().change_scene("scenes/stages/normal_mode/stage.tscn")


func _on_no_enemies_mode_pressed():
	get_tree().change_scene("scenes/stages/no_enemies_mode/stage_no_enemies.tscn")
	
	