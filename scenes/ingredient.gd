extends Sprite2D

const SPEED: int = 2000

func _process(delta: float) -> void:
	global_position = get_viewport().get_mouse_position()
	var vec: Vector2 = get_viewport().get_mouse_position() - self.position
	
	if vec > Vector2(0.01, 0.01):
		vec = vec.normalized() * delta * SPEED
		position += vec
	if Globals.mortared == true:
		texture = load(Globals.INGR_FILES[Globals.ingredient_type_global][1])
	else:
		texture = load(Globals.INGR_FILES[Globals.ingredient_type_global][0])
