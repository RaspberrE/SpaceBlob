extends Node

var blob_amount = 0
var health = Vector2(10, 10) #health.x is the amount of health, meanwhile health.y is the maximum health
var gold = 0
var amethyst = 0
var text = false
var keys = 0
var text_contents = "*testing text"
var slime_form = "bunny"
var blob_menu_select = "Bunny"
var invincibility = Vector2(0,1) #x = starting, y= finished
var no_grav = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
