extends VBoxContainer

var options_list = []
var current_choice_id = 0

func _ready():
	$HBox/PrevButton.connect("pressed", self, "_on_prev_button")
	$HBox/NextButton.connect("pressed", self, "_on_next_button")

func update_label(choice = options_list[current_choice_id]):
	$HBox/Label.text = choice

func _on_prev_button():
	if current_choice_id == 0:
		current_choice_id = options_list.size() - 1
	else:
		current_choice_id -= 1
	
	update_label()

func _on_next_button():
	if current_choice_id == options_list.size() - 1:
		current_choice_id = 0
	else:
		current_choice_id += 1

	update_label()