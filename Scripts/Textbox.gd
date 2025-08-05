extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$".".visible = Globalvars.text
	$Description.text = Globalvars.text_contents
	if Globalvars.text == true:
		if Input.is_action_just_pressed("Attack"):
			Globalvars.text = false
