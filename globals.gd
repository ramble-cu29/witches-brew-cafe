extends Node

var ingredient_exists:bool = false 
var ingredient_type_global:Ingredients

enum Ingredients {
	NULL,
	STRAWBERRY,
	BLUEBERRY,
	RASPBERRY,
	CHERRY,
	ROSE,
	CINNAMON,
	SPEARMINT,
	LAVENDER,
	BEANS,
}

enum Actions {
	NULL,
	INGREDIENT_PLACED,
	INGREDIENT_GROUND,
	ESPRESSO_DISPENSED,
	HOTWATER_DISPENSED
}

const INGR_FILES: Dictionary[Ingredients, String] = {
	Ingredients.STRAWBERRY: "res://art/boh/strawberry.png",
	Ingredients.BLUEBERRY: "res://art/boh/blueberry.png",
	Ingredients.RASPBERRY: "res://art/boh/raspberry.png",
	Ingredients.CHERRY: "res://art/boh/cherry.png",
	Ingredients.ROSE: "res://art/boh/rose.png",
	Ingredients.CINNAMON: "res://art/boh/cinnamon.png",
	Ingredients.SPEARMINT: "res://art/boh/spearmint.png",
	Ingredients.LAVENDER: "res://art/boh/lavender.png",
	Ingredients.BEANS: "res://art/boh/beans.png",
}

var recipe_record: Array = []
