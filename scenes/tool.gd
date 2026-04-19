extends Sprite2D

signal placed

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false and Globals.ingredient_exists:
			if is_pixel_opaque(get_local_mouse_position()) and (Globals.mortared==true or Globals.liquid_filled==true):
				Globals.recipe_record.append(Globals.ingredient_type_global)
				placed.emit()
				Globals.mortared=false

func _process(delta: float) -> void:
	match Globals.recipe_record.size():
		0:
			$Bubbles.stop()
			$Bubbles.modulate=Color(255,255,255,0)
			$Liquid.texture=null
		1:
			$Bubbles.play("bubbles")

			$Liquid.texture=load("res://art/boh/Cauldron-liquid/Untitled_Artwork-4.png")
		2:
			$Liquid.texture=load("res://art/boh/Cauldron-liquid/Untitled_Artwork-3.png")
		3:
			$Liquid.texture=load("res://art/boh/Cauldron-liquid/Untitled_Artwork-2.png")
		_:
			$Liquid.texture=load("res://art/boh/Cauldron-liquid/Untitled_Artwork-1.png")
	
	if "beans" in Globals.recipe_record:
		$Liquid.modulate=Color(0.34,0.18,0.03,1)
		$Bubbles.modulate=Color("d37b2fff")
	elif "tea" in Globals.recipe_record:
		$Liquid.modulate=Color("1f2b20ff")
		$Bubbles.modulate=Color("4d725dff")
