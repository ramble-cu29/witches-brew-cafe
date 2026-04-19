extends Node

var ingredient: Node = preload("res://scenes/ingredient.tscn").instantiate()
@onready var boil: AudioStreamPlayer = $BoilingCauldron
@export var boil_fade_in_seconds: float = 4.0
@export var boil_target_volume_db: float = -9.7
@export var boil_start_volume_db: float = -50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	play_boil_loop()
	Globals.recipe_builder()
	
# If the left mouse button is up and the ingredient is inside the tree, remove it from the 
# tree and set the flag ingredient_exists to false as well as liquid_filled
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false:
			if ingredient.is_inside_tree():
				remove_child(ingredient)
				Globals.ingredient_exists = false
				Globals.liquid_filled = false
				
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
	Globals.current_recipe.append(Globals.ingredient_type_global)
	print(str(Globals.ingredient_type_global) + " placed!")

func play_boil_loop() -> void:
		boil.volume_db = boil_start_volume_db
		boil.play()
		var tween: Tween = create_tween()
		tween.tween_property(
			boil,
			"volume_db",
			boil_target_volume_db,
			boil_fade_in_seconds
		)
		await boil.finished


func _on_mortar_mortar() -> void:
	create_ingredient()
