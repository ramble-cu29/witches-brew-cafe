extends Node

var ingredient_exists:bool = false 
var ingredient_type_global:String

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
}

var recipe_record: Array = []
