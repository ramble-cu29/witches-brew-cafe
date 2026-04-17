extends Sprite2D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false and Globals.ingredient_exists:
			$IngDrop.play()
			if is_pixel_opaque(get_local_mouse_position()):
				print("Mortar ingredient placed")
				
				$MortarIngredient.animation = Globals.ingredient_type_global
				print(str("Animation is " + $MortarIngredient.animation))


func _on_pestle_pestle() -> void:
	$AnimationPlayer.play("mortar_and_pestle")
	$Grind.play()
