extends Sprite2D

signal pressed

@export var ingredient_type:String = ""

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if is_pixel_opaque(get_local_mouse_position()):
				Globals.ingredient_type_global = ingredient_type
				if Globals.ingredient_type_global not in ["espresso", "milk", "water"]:
					pressed.emit()
				if Globals.liquid_filled == true:
					pressed.emit()

		#elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false:
			#released.emit()
