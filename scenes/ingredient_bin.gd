extends Sprite2D

signal pressed
signal released

@export var ingredient_type: String

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				pressed.emit()
				ingredient_type = 
		#elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false:
			#released.emit()
