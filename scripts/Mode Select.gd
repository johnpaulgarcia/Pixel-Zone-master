extends Control
func _process(delta):
	if $CheckButton.pressed == true:
		$RichTextLabel.show()
	if $CheckButton.pressed == false:
		$RichTextLabel.hide()
		
func _on_Normal_mode_pressed():
	get_tree().change_scene("scenes/stages/pixel_adventure/stage.tscn")



	
	