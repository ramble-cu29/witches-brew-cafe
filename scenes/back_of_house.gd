extends Node

var ingredient: Node = preload("res://scenes/ingredient.tscn").instantiate()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	Globals.recipe_builder()
	
# If the left mouse button is up and the ingredient is inside the tree, remove it from the 
# tree and set the flag ingredient_exists to false as well as liquid_filled
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false:
			if ingredient.is_inside_tree() and Globals.finished==false:
				remove_child(ingredient)
				Globals.ingredient_exists = false
				Globals.liquid_filled = false
			elif ingredient.is_inside_tree() and Globals.finished==true:
				print(Globals.cup_recipe)
				print(Globals.current_recipe)
				if check_array(Globals.cup_recipe, Globals.current_recipe)==true:
					print("YOU DID IT")
				Globals.finished=false
				remove_child(ingredient)
				
# When you get the signal from the ingredient bin that it has been clicked
# add the ingredient to the tree at the mouse position, set the flag to true,
# and load the right texture
func create_ingredient() -> void:
	# We create a new child ingredient and place it in the world
	add_child(ingredient)
	Globals.ingredient_exists = true
	ingredient.global_position = get_viewport().get_mouse_position()
	print(Globals.ingredient_type_global)
	
	# If the liquid has been filled, set the animation in the espresso/liquid machine back to neutral
	if Globals.liquid_filled == true:
		#Globals.liquid_filled = false
		$EspressoMachine.frame = 0
		$LiquidMachine.frame = 0
	$Lid.volume_db = 6
	$Lid.play()

func _on_ingredient_bin_pressed() -> void:
	create_ingredient()

func _on_cauldron_placed() -> void:
	$CauldronBloop.play()



func _on_mortar_mortar() -> void:
	create_ingredient()

func _on_button_pressed() -> void:
	$Customer.take_order()
	

func _on_button_2_pressed() -> void:
	print(Globals.recipe_record)



func _on_coffee_cup_coffee_cup() -> void:
	create_ingredient()
	$CoffeeCup.global_position=Vector2(-100,750)
	
func check_array(array1:Array, array2:Array) -> bool:
	if array1.size() != array2.size():
		return false
	
	for item:String in array1:
		if !array2.has(item):
			return false
		if array1.count(item) != array2.count(item):
			return false
	
	return true
	
