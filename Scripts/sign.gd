extends Node2D

@onready var area_2d: Area2D = $SignSprite/Area2D

var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact") and player_in_area == true and Globalvars.text == false:
		$Label.visible = false
		Globalvars.text_contents = "Press 'A' to move left, and press D to move right! Press 'Space' to jump! (You will be able to move differently later in the game!)"
		Globalvars.text = true
	else:
		pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		$Label.visible = true
		player_in_area = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "PLAYER":
		$Label.visible = false
		player_in_area = false
