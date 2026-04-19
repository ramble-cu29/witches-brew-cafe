extends Sprite2D

signal mortar
var first_time:bool=true


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# If ingredient is dropped over mortar
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false and Globals.ingredient_exists:
			$IngDrop.play()
			if is_pixel_opaque(get_local_mouse_position()):
				print("Mortar ingredient placed")
				$MortarIngredient.animation = Globals.ingredient_type_global
				#await $MortarIngredient.animation_finished()
				print(str("Animation is " + $MortarIngredient.animation))
				first_time=false
		# If mortar is clicked
		elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed and is_pixel_opaque(get_local_mouse_position()) and first_time == false:
			if  Globals.mortared==false:
				$AnimationPlayer.play("mortar_and_pestle")
				$Grind.play()
				await $AnimationPlayer.animation_finished
				Globals.mortared=true
			if Globals.mortared==true:
				mortar.emit()
