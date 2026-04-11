extends Sprite2D

signal placed

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false and Globals.ingredient_exists:
			if is_pixel_opaque(get_local_mouse_position()):
				placed.emit()
