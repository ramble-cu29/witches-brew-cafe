extends Node

var ingredient: Node = preload("res://scenes/ingredient.tscn").instantiate()

var recipe:Array = [
	Globals.Ingredients.BEANS,
	Globals.Ingredients.RASPBERRY,
	Globals.Ingredients.CHERRY,
	Globals.Ingredients.ROSE
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# If the left mouse button is up and the ingredient is inside the tree, remove it from the 
# tree and set the flag ingredient_exists to false
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false:
			if ingredient.is_inside_tree():
				remove_child(ingredient)
				Globals.ingredient_exists = false

# When you get the signal from the ingredient bin that it has been clicked
# add the ingredient to the tree at the mouse position, set the flag to true, 
# and load the right texture
func _on_ingredient_bin_pressed() -> void:
	add_child(ingredient)
	Globals.ingredient_exists = true
	ingredient.global_position = get_viewport().get_mouse_position()
	ingredient.texture = load(Globals.INGR_FILES[Globals.ingredient_type_global])


func _on_tool_placed() -> void:
	print(str(Globals.ingredient_type_global) + " placed!")


func _on_button_button_up() -> void:
	print("The recipe followed was: " + str(Globals.recipe_record))
	print("The recipe you needed to follow was: " + str(recipe))
	if(str(Globals.recipe_record) == str(recipe)):
		print("You did it!")
	Globals.recipe_record.clear()


func _on_button_2_button_up() -> void:
	recipe.clear()
	$GUI/Panel/RecipeLabel.text = "Recipe:"
	print(Globals.Ingredients.size())
	print(Globals.Ingredients.keys()[randi() % Globals.Ingredients.size()])
	for i: int in range(4):
		var ingr:String = Globals.Ingredients.keys()[randi() % Globals.Ingredients.size()]
		$GUI/Panel/RecipeLabel.text += ingr
