extends Node2D


# Called when the node enters the scene tree for the firsaaat time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var bodies = $StaticBody2D/Area2D.get_overlapping_bodies()
	if not bodies.is_empty():
		for body in bodies:
			if body.name == "PLAYER" and Globalvars.invincibility.x == 0 and Globalvars.invincibility.y == 1:
				Globalvars.health.x -= 1
				Globalvars.invincibility.x = 1
# get_overlapping_bodies is a area2D function, which gives an array of bodies that are touching the area.
# is_empty checks if an array is empty.
