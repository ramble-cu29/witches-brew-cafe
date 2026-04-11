extends Node

var ingredient: Node = preload("res://scenes/ingredient.tscn").instantiate()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false:
			if ingredient.is_inside_tree():
				remove_child(ingredient)
				Globals.ingredient_exists = false

func _on_ingredient_bin_pressed() -> void:
	add_child(ingredient)
	Globals.ingredient_exists = true
	ingredient.global_position = get_viewport().get_mouse_position()
	ingredient.texture = load(Globals.INGREDIENT_LIST[Globals.ingredient_type_global])


func _on_tool_placed() -> void:
	print(Globals.ingredient_type_global + " placed!")
