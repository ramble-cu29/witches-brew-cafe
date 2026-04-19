extends Node

var ingredient_exists:bool = false 
var ingredient_type_global:String
var current_recipe:Array
var recipe_record:Array
var liquid_filled:bool=false
var mortared:bool=false

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
	"strawberry": ["res://art/boh/strawberry.png", "res://art/animations/Strawberry-animation/10.png"],
	"blueberry": ["res://art/boh/blueberry.png", "res://art/animations/Blueberry-animation/10.png"],
	"raspberry": ["res://art/boh/raspberry.png", "res://art/animations/Raspberry-animation/10.png"],
	"cherry": ["res://art/boh/cherry.png","res://art/animations/Cherry-animation/10.png"],
	"rose": ["res://art/boh/rose.png","res://art/animations/Rose-petal-animation/10.png"],
	"cinnamon": ["res://art/boh/cinnamon.png","res://art/animations/Cinnamon-animation/10.png"],
	"spearmint": ["res://art/boh/spearmint.png","res://art/animations/Spearmint-animation/10.png"],
	"lavender": ["res://art/boh/lavender.png","res://art/animations/Lavender-animation/10.png"],
	"beans": ["res://art/boh/beans.png","res://art/animations/Coffee-beans-animation/10.png"],
	"tea": ["res://art/boh/tea_leaves.png","res://art/animations/Tea-leaves-animation/10.png"],
	"espresso": ["res://art/boh/Liquid-icons/espresso_cup.png",""],
	"water": ["res://art/boh/Liquid-icons/water_cup.png",""],
	"milk": ["res://art/boh/Liquid-icons/milk_cup.png",""]
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
	
	
