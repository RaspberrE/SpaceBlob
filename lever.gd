extends Node2D
var is_in_area = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_in_area = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact") and is_in_area == true:
		if $AnimatedSprite2D.frame == 0:
			$AnimatedSprite2D.frame +=1
		elif $AnimatedSprite2D.frame == 1:
			$AnimatedSprite2D.frame -=1
			
	



func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body.name == "PLAYER":
		$AnimatedSprite2D/Label.visible = true
		is_in_area = true

func _on_area_2d_body_exited(_body: Node2D) -> void:
	if _body.name == "PLAYER":
		$AnimatedSprite2D/Label.visible = false
		is_in_area = false
