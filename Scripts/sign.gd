extends Node2D

@onready var area_2d: Area2D = $SignSprite/Area2D

var player_in_area = false
var location = Vector2(0,0) #x = scene, y = sign num
var sign_slides = Vector2(0,0) #x = current slide, y = max slides in sign
@export_range (0,5) var scrollspeed = 0
func clear_sign():
	Globalvars.text = false
	sign_slides.x = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	for i in $".".get_parent().scene_file_path.get_basename():
		if i.is_valid_int() == true:
			location.x = int(i)
			
	for i in $".".scene_file_path.get_basename():
		if i.is_valid_int() == true:
			location.y = int(i)
	
	if Input.is_action_just_released("Interact") and player_in_area == true :
		pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		$Label.visible = true
		player_in_area = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "PLAYER":
		$Label.visible = false
		player_in_area = false
