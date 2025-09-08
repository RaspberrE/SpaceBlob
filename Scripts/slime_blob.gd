extends Node2D

@onready var area: Area2D = $SlimeBlobANIM/Area2D

var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact") and player_in_area == true:
		Globalvars.blob_amount += 1
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		$Label.visible = true
		player_in_area = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "PLAYER":
		$Label.visible = false
		player_in_area = false
