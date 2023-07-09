extends Node2D

const dungeonConst = preload("res://GMTK_Jam/Nodes/Dungeon.tscn")
var dungeonInventory : InventoryData = preload("res://GMTK_Jam/ScriptableObjects/Instances/MatInventory/DungeonInventory.tres")
var inventory: InventoryData = preload("res://GMTK_Jam/ScriptableObjects/Instances/MatInventory/Inventory.tres")

var main_scene_ref:Node2D
var money:int
var rent_value: float

var hold_item: ItemData

var start_time: float
var item_sold = 0

func _ready():
	money = 500
	rent_value = 100

func reset():
	money = 500
	rent_value = 100
	
func create_dungeon(power:int, item_type: String):
	var dungeon = dungeonConst.instantiate()
	main_scene_ref.add_child(dungeon)
	dungeon._create_dungeon_instance(power,item_type)

func material_add(item,quality):
	dungeonInventory.queue_add(item,quality)
	
func add_to_inventory():
	inventory.bulk_add(dungeonInventory)
	dungeonInventory.slot_datas.clear()

func pay_rent():
	money -= int(rent_value)
	rent_value *= 1.1
	if (money < 0):
		get_tree().change_scene_to_file("res://GMTK_Jam/UIElement/GameOverScreen/GameOver.tscn")
