extends Node2D

signal add_blob
@onready var area: Area2D = $SlimeBlobANIM/Area2D

var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		Globalvars.blob_amount += 1
		print(Globalvars.blob_amount)
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		$Label.visible = true
		player_in_area = true
		
	print(body.name)
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "PLAYER":
		$Label.visible = false
		player_in_area = false


func _on_add_blob() -> void:
	pass # Replace with function body.
