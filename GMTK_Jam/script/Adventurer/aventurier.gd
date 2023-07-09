extends Area2D

const inventory = preload("res://GMTK_Jam/ScriptableObjects/Instances/MatInventory/Inventory.tres")
const mat_type = [
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Ring.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Stick.tres"),
	preload("res://GMTK_Jam/ScriptableObjects/Instances/Materials/Stone.tres")
]
@onready var canvas_layer = $CanvasLayer
@onready var item_slot_ui = $CanvasLayer/ItemSlotUI


var adventurerInShop
@export var classAdventurer:String
var class_reference: AdventurerData
var objectSell
var powerAventurer: int = 10
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
	item_slot_ui.set_global_position($SpriteAventurer.global_position+Vector2(-200,-250))

func item_processing(item: ItemData):
	Main.hold_item = null
	match (item.item_name):
		"Sword":
			$SpriteAventurer.texture = class_reference.texture_sword
		"Wand":
			$SpriteAventurer.texture = class_reference.texture_wand
		"Bow":
			$SpriteAventurer.texture = class_reference.texture_bow
	if (item.item_name == classAdventurer):
		powerAventurer *= item.quality
	else:
		powerAventurer = 5
	_buy(powerAventurer)

func _sell():
	print("Adventurer sells you Object for X gold")
	advHasSell=true
	var quality = rng.randi_range(1,10)
	var type = rng.randi_range(0,2)
	Main.money -= quality*5
	inventory.add(mat_type[type],quality)
	
func _buy(money: int):
	print("Adventurer buy you weapon for X gold")
	Main.money += money
	advhasBuy=true
	
	item_slot_ui.hide()

# lorsque l'aventurier va dans le donjon
func _exitShop():
	adventurerInShop=false

# parametre l'aventurier en fonction de la classe passee en argument

func setClass(data: AdventurerData):
	class_reference = data
	classAdventurer = data.className
	
	$SpriteAventurer.texture = data.texture_neutral
	var speed_multiplier = rng.randi_range(0,5)
	
	speedAdventurer = 40 + 10*speed_multiplier
	self.z_index = speed_multiplier
	$CanvasLayer.layer = speed_multiplier




func _on_item_slot_ui_gui_input(event):
	if event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT \
			or event.button_index == MOUSE_BUTTON_RIGHT) \
			and event.is_pressed():
		if (Main.hold_item):
			item_processing(Main.hold_item)
