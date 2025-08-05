extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".play(str(Globalvars.health.y))
	$".".pause()
	$".".frame = int(Globalvars.health.x)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $".".animation != str(Globalvars.health.y):
		$".".play(str(Globalvars.health.y))
		$".".pause()
	if $".".frame != int(Globalvars.health.x):
		$".".frame = int(Globalvars.health.x)
