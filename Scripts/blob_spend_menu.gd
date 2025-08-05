extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false
	$DetailsArea.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globalvars.blob_menu_select == "Bunny":
		$"Scroll container/VBoxContainer/BunnyFormButton".modulate = Color(0,1,0)
	else:
		$"Scroll container/VBoxContainer/BunnyFormButton".modulate = Color(1,1,1)
	if Globalvars.blob_menu_select == "Stickman":
		$"Scroll container/VBoxContainer/StickmanFormButton".modulate = Color(0,1,0)
	else:
			$"Scroll container/VBoxContainer/StickmanFormButton".modulate = Color(1,1,1)
			
func _on_bunny_form_button_button_up() -> void:
	Globalvars.looking_form_cost = 0
	$DetailsArea/Cost.text = "Price: 0 Blobs"
	$DetailsArea.visible = true
	$DetailsArea/FormPic.texture=load("res://Assets/Bunny_form.png")
	Globalvars.blob_menu_select = "Bunny"
	$DetailsArea/FormName.text = "B u n n y   f o r m"
	$DetailsArea/ScrollContainer/VBoxContainer/Description.text = "The bunny form is  the defult form. 
The bunny does not have many benefits,
 as it can only walk and jump. (The bunny 
 is cute though :D)"
	if Globalvars.slime_form == "bunny":
		$DetailsArea/EquipStatus.text = "Equipped!"
		$"DetailsArea/Equip button".text = "Equipped"
		$"DetailsArea/Equip button".modulate = Color(0,1,0)
	else:
		$DetailsArea/EquipStatus.text = "Unequipped"
		$"DetailsArea/Equip button".modulate = Color(1,1,1)
		$"DetailsArea/Equip button".text = "Press to swap forms"
	if Globalvars.slime_form != "bunny" and Globalvars.blob_amount < 0 : #Number is price of form
		$"DetailsArea/Equip button".text = "Cannot afford!"
		$"DetailsArea/Equip button".modulate = Color(1,0,0)
		$DetailsArea/EquipStatus.text = "Unequipped"

func _on_stickman_form_button_button_up() -> void:
	Globalvars.looking_form_cost = 1
	$DetailsArea/Cost.text = "Price: 1 Blobs"
	$DetailsArea.visible = true
	$DetailsArea/FormPic.texture=load("res://Assets/Stickman_form.png")
	Globalvars.blob_menu_select = "Stickman"
	$DetailsArea/FormName.text = "S t i c k m a n   f o r m"
	$DetailsArea/ScrollContainer/VBoxContainer/Description.text = "The stickman form has different classes
 you can equip, but base stickman allows
you to run and wall jump! 
[CLASSES TO BE ADDED!!! ]"
	if Globalvars.slime_form == "stickman":
		$DetailsArea/EquipStatus.text = "Equipped!"
		$"DetailsArea/Equip button".text = "Equipped"
		$"DetailsArea/Equip button".modulate = Color(0,1,0)
	else:
		$DetailsArea/EquipStatus.text = "Unequipped"
		$"DetailsArea/Equip button".modulate = Color(1,1,1)
		$"DetailsArea/Equip button".text = "Press to swap forms"
		
	if Globalvars.slime_form != "stickman" and Globalvars.blob_amount < 1 : #Number is price of form
		$"DetailsArea/Equip button".text = "Cannot afford!"
		$"DetailsArea/Equip button".modulate = Color(1,0,0)
		$DetailsArea/EquipStatus.text = "Unequipped"
		
func _on_close_menu_button_button_up() -> void:
	$".".visible = false
	$DetailsArea.visible = false


func _on_equip_button_button_up() -> void:
	if Globalvars.slime_form == Globalvars.blob_menu_select.to_lower():
		pass
	elif Globalvars.slime_form != Globalvars.blob_menu_select.to_lower():
		if Globalvars.blob_menu_select == "Stickman" and Globalvars.blob_amount >= Globalvars.looking_form_cost:
			Globalvars.changing_forms = true
			Globalvars.slime_form = "stickman"
			Globalvars.blob_amount += (Globalvars.current_form_cost - Globalvars.looking_form_cost)
			if Globalvars.slime_form == "stickman":
				$DetailsArea/EquipStatus.text = "Equipped!"
				$"DetailsArea/Equip button".text = "Equipped"
				$"DetailsArea/Equip button".modulate = Color(0,1,0)
			
		elif Globalvars.blob_menu_select == "Bunny" and Globalvars.blob_amount >= Globalvars.looking_form_cost:
			Globalvars.blob_amount += (Globalvars.current_form_cost - Globalvars.looking_form_cost)
			Globalvars.slime_form = "bunny"
			if Globalvars.slime_form == "bunny":
				$DetailsArea/EquipStatus.text = "Equipped!"
				$"DetailsArea/Equip button".text = "Equipped"
				$"DetailsArea/Equip button".modulate = Color(0,1,0)
