extends AnimatedSprite2D

var ingredient:String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_water_button_pressed() -> void:
	play("water")
	await animation_finished
	Globals.liquid_filled = true
	

func _on_milk_button_pressed() -> void:
	play("milk")
	Globals.liquid_filled = true
