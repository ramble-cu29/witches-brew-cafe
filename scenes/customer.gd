extends Sprite2D


var textures:Array = [
	"res://art/foh/fairy.png",
	"res://art/foh/ghost.png",
	"res://art/foh/werewolf.png",
	"res://art/foh/wizard.png",
]

func _ready() -> void:
	$SpeechBubble.hide()
	hide()


func take_order() -> void:
	
	texture=load(textures[randi() % 4])
	show()
	$SpeechBubble.show()
	
	Globals.recipe_builder()

	
	$SpeechBubble/Ingredient1.texture = load(Globals.INGR_FILES[Globals.current_recipe[0]][0])
	$SpeechBubble/Ingredient2.texture = load(Globals.INGR_FILES[Globals.current_recipe[1]][0])
	$SpeechBubble/Ingredient3.texture = load(Globals.INGR_FILES[Globals.current_recipe[2]][0])
	$SpeechBubble/Ingredient4.texture = load(Globals.INGR_FILES[Globals.current_recipe[3]][0])
	
	await get_tree().create_timer(3.0).timeout
	#$SpeechBubble.hide()

#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false and Globals.ingredient_exists:
			#if is_pixel_opaque(get_local_mouse_position()) and Globals.finished==true:
				#pass
