extends Sprite2D

signal coffee_cup

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				Globals.ingredient_type_global="coffee_cup"
				coffee_cup.emit()
