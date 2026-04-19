extends Node

var ingredient_exists:bool = false 
var ingredient_type_global:String
var current_recipe:Array
var recipe_record:Array
var liquid_filled:bool=false

enum Actions {
	NULL,
	INGREDIENT_PLACED,
	INGREDIENT_GROUND,
	ESPRESSO_DISPENSED,
	HOTWATER_DISPENSED
}

const INGREDIENTS:Array[String] = [
	"",
	"strawberry",
	"blueberry",
	"raspberry",
	"cherry",	
	"rose",
	"cinnamon",
	"spearmint",
	"lavender",
	"beans",
	"tea",
	"espresso",
	"water",
	"milk"
]

const INGR_FILES: Dictionary = {
	"strawberry": "res://art/boh/strawberry.png",
	"blueberry": "res://art/boh/blueberry.png",
	"raspberry": "res://art/boh/raspberry.png",
	"cherry": "res://art/boh/cherry.png",
	"rose": "res://art/boh/rose.png",
	"cinnamon": "res://art/boh/cinnamon.png",
	"spearmint": "res://art/boh/spearmint.png",
	"lavender": "res://art/boh/lavender.png",
	"beans": "res://art/boh/beans.png",
	"tea": "res://art/boh/tea_leaves.png",
	"espresso": "res://art/boh/Liquid icons/espresso_cup.png",
	"water": "res://art/boh/Liquid icons/water_cup.png",
	"milk": "res://art/boh/Liquid icons/milk_cup.png"
}



func recipe_builder() -> void:
	var base_recipes: Dictionary = {
		"red_eye": ["espresso", "beans"],
		"americano": ["espresso", "water"],
		"latte": ["espresso", "milk"],
		"tea": ["tea", "water"],
	}
	var berries: Array = INGREDIENTS.slice(1, 5)
	var witchy: Array = INGREDIENTS.slice(5, 9)

	var recipe: Array = base_recipes["red_eye"]
	
	recipe.append(berries[randi() % 4])
	recipe.append(witchy[randi() % 4])

	current_recipe = recipe
	
	
