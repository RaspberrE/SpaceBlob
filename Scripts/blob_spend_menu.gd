extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globalvars.blob_menu_select == "Bunny":
		$"Scroll container/VBoxContainer/BunnyFormButton".modulate = Color(0,1,0)
	else:
		$"Scroll container/VBoxContainer/BunnyFormButton".modulate = Color(1,1,1)
	if Globalvars.blob_menu_select == "Stickman":
		$"Scroll container/VBoxContainer/StickmanFormButton".modulate = Color(0,1,0)
	else:
			$"Scroll container/VBoxContainer/StickmanFormButton".modulate = Color(1,1,1)
	if Input.is_action_just_pressed("SlimeMenu"):
		$".".visible = true

func _on_bunny_form_button_button_up() -> void:
	Globalvars.blob_menu_select = "Bunny"


func _on_stickman_form_button_button_up() -> void:
	Globalvars.blob_menu_select = "Stickman"



func _on_close_menu_button_button_up() -> void:
	$".".visible = false
