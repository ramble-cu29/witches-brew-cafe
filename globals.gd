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

const INGR_FILES: Dictionary[Ingredients, String] = {
	Ingredients.STRAWBERRY: "res://art/programmer_art/strawberry.png",
	Ingredients.BLUEBERRY: "res://art/programmer_art/blueberry.jpg",
	Ingredients.RASPBERRY: "res://art/programmer_art/raspberry.jpg",
	Ingredients.CHERRY: "res://art/programmer_art/cherry.png",
	Ingredients.ROSE: "res://art/programmer_art/rose.jpg",
	Ingredients.CINNAMON: "res://art/programmer_art/cinnamon.png",
	Ingredients.SPEARMINT: "res://art/programmer_art/spearmint.jpg",
	Ingredients.LAVENDER: "res://art/programmer_art/lavender.jpg",
	Ingredients.BEANS: "res://art/programmer_art/beans.jpg",
}

var recipe_record: Array = []
