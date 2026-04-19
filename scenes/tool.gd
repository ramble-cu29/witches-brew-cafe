extends Sprite2D

@onready var boil: AudioStreamPlayer = $BoilingCauldron
@export var boil_fade_in_seconds: float = 2.0
@export var boil_target_volume_db: float = -9.7
@export var boil_start_volume_db: float = -50.0

signal placed

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false and Globals.ingredient_exists:
			if is_pixel_opaque(get_local_mouse_position()) and (Globals.mortared==true or Globals.liquid_filled==true):
				Globals.recipe_record.append(Globals.ingredient_type_global)
				placed.emit()
				Globals.mortared=false

func _process(delta: float) -> void:
	match Globals.recipe_record.size():
		0:
			$Bubbles.stop()
			$Bubbles.modulate=Color(255,255,255,0)
			$Liquid.texture=null
		1:
			$Bubbles.play("bubbles")
			play_boil_loop()
			$Liquid.texture=load("res://art/boh/Cauldron-liquid/Untitled_Artwork-4.png")
		2:
			$Liquid.texture=load("res://art/boh/Cauldron-liquid/Untitled_Artwork-3.png")
		3:
			$Liquid.texture=load("res://art/boh/Cauldron-liquid/Untitled_Artwork-2.png")
		_:
			$Liquid.texture=load("res://art/boh/Cauldron-liquid/Untitled_Artwork-1.png")
	
	if "beans" in Globals.recipe_record:
		$Liquid.modulate=Color(0.34,0.18,0.03,1)
		$Bubbles.modulate=Color("d37b2fff")
	elif "tea" in Globals.recipe_record:
		$Liquid.modulate=Color("1f2b20ff")
		$Bubbles.modulate=Color("4d725dff")

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
