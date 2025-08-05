extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globalvars.invincibility.x == 1:
		Globalvars.invincibility.y =0
		Globalvars.health.x -= 0
		$".".self_modulate = Color("red")
		Globalvars.invincibility.x = 0
		await get_tree().create_timer(0.5).timeout
		Globalvars.invincibility.y =1
		$".".self_modulate = Color("white")
