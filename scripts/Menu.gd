extends Panel

var current_page = null


func _ready():
	connect("visibility_changed", self, "_on_visibility_changed")
	settings.connect("window_minimized_changed", self, "_on_window_minimized_changed")

func _on_visibility_changed():
	get_tree().paused = visible
	if visible:
		globals.play_bgm("Menu", true)
		globals.play_bgm("Level", false)
	else:
		globals.play_bgm("Menu", false)
		globals.play_bgm("Level", true)

func show_page(node):
	if current_page != null:
		current_page.hide()
	node.show()
	current_page = node

func _on_Quit_pressed():
	get_node("ConfirmationDialog").popup_centered()

# when preesed "Return" or "No" button in Quit Page
func _on_Return_pressed():
	hide()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		visible = !visible

func _on_Options_pressed():
	show_page($OptionsPage)

func _on_window_minimized_changed(value):
	show()


func _on_Stats_pressed():
	show_page($StatsPage)


func _on_Save_pressed():
	get_node("Save_dialog").popup_centered()


func _on_Load_pressed():
	get_node("Load_dialog").popup_centered()

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

func _on_Controls_pressed():
	show_page($ControlsPage)


func _on_ConfirmationDialog_confirmed():
	get_tree().quit()