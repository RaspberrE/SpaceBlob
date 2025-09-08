extends ColorRect

@export_file("*.json") var d_file

var dialouge = []

func _ready() -> void:
	$".".visible = true
	start()
	
func start():
	$".".visible = Globalvars.text
	$Name.visible = Globalvars.text
	$Dialouge.visible = Globalvars.text
	$Phrase.visible = Globalvars.text
	dialouge = load_dialouge()
	$Name.text = dialouge[0]["name"]
	$Dialouge.text = dialouge[0]["text"]

func  load_dialouge():
	var file = FileAccess.open(d_file, FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
