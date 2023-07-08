extends Area2D

const inventory = preload("res://GMTK_Jam/ScriptableObjects/Instances/MatInventory/Inventory.tres")
const mat_type = [
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Ring.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Stick.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Stone.tres")
]


var adventurerInShop
@export var classAdventurer:String
var class_reference: AdventurerData
var objectSell
var powerAventurer = 10
@export var speedAdventurer:int
var advHasSell
var advhasBuy
var speedAdvBuy = 400
@onready var sprite_aventurer = $SpriteAventurer

var rng = RandomNumberGenerator.new()


func _ready():
	adventurerInShop=true
	advHasSell=false
	advhasBuy=false

func _process(delta):
	if(adventurerInShop==true):
		if(advhasBuy):
			position.x += delta*speedAdvBuy
		else:
			position.x += delta*speedAdventurer

func item_processing(item: ItemData):
	match (item.item_name):
		"Sword":
			$SpriteAventurer.texture = class_reference.texture_sword
		"Wand":
			$SpriteAventurer.texture = class_reference.texture_wand
		"Bow":
			$SpriteAventurer.texture = class_reference.texture_bow
	if (item.item_name == classAdventurer):
		powerAventurer *= item.quality

func _sell():
	print("Adventurer sells you Object for X gold")
	advHasSell=true
	var quality = rng.randi_range(1,10)
	var type = rng.randi_range(0,2)
	Main.money -= quality*5
	inventory.add(mat_type[type],quality)
	
func _buy():
	print("Adventurer buy you weapon for X gold")
	advhasBuy=true

# lorsque l'aventurier va dans le donjon
func _exitShop():
	adventurerInShop=false

# parametre l'aventurier en fonction de la classe passee en argument
<<<<<<< Updated upstream
func setClass(data: AdventurerResource):
=======
func setClass(data: AdventurerData):
	class_reference = data
>>>>>>> Stashed changes
	classAdventurer = data.className
	
	$SpriteAventurer.texture = data.texture_neutral
	var speed_multiplier = rng.randi_range(0,5)
	
	speedAdventurer = 40 + 10*speed_multiplier
	self.z_index = speed_multiplier
