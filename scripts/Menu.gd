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
	
func _on_Save_dialog_file_selected(path):
    var save_game = File.new()
    save_game.open(path, File.WRITE)
    var save_nodes = get_tree().get_nodes_in_group("Persist")
    for i in save_nodes:
        var node_data = {
        "parent" : get_parent().get_path(),
        "coins_points" : get_node("/root/game_state").points,
        "killed_enemies_points" : get_node("/root/killed_enemies").points,
        "experience_points" : get_node("/root/game_experience").points,
		"pos_x" : get_position().x,
		"pos_y" : get_position().y,
	}
        save_game.store_line(to_json(node_data))
    save_game.close()


func _on_Load_dialog_file_selected(path):
    var save_game = File.new()
    if not save_game.file_exists(path):
        return # Error! We don't have a save to load.

    # We need to revert the game state so we're not cloning objects
    # during loading. This will vary wildly depending on the needs of a
    # project, so take care with this step.
    # For our example, we will accomplish this by deleting savable objects.
    var save_nodes = get_tree().get_nodes_in_group("Persist")
    for i in save_nodes:
        i.queue_free()

    # Load the file line by line and process that dictionary to restore
    # the object it represents.
    save_game.open(path, File.READ)
    while save_game.eof_reached():
        var current_line = parse_json(save_game.get_line())
        # Firstly, we need to create the object and add it to the tree and set its position.
        var new_object = load(current_line["filename"]).instance()
        get_node(current_line["parent"]).add_child(new_object)
        new_object.position = (Vector2(current_line["pos_x"], current_line["pos_y"]))
        # Now we set the remaining variables.
	
        for i in current_line.keys():
            if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
                continue
            new_object.set(i, current_line[i])
			
    save_game.close()


func _on_ConfirmationDialog_confirmed():
	get_tree().quit()