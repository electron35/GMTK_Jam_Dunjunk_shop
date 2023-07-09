extends Node2D

const dungeonConst = preload("res://GMTK_Jam/Nodes/Dungeon.tscn")
var dungeonInventory : InventoryData = preload("res://GMTK_Jam/ScriptableObjects/Instances/MatInventory/DungeonInventory.tres")
var inventory: InventoryData = preload("res://GMTK_Jam/ScriptableObjects/Instances/MatInventory/Inventory.tres")

var main_scene_ref:Node2D
var money:int
var rent_value: float

var hold_item: ItemData

func _ready():
	money = 500
	rent_value = 100
	
func create_dungeon(power:int, item_type: String):
	var dungeon = dungeonConst.instantiate()
	main_scene_ref.add_child(dungeon)
	dungeon._create_dungeon_instance(power,item_type)
	print("")
	

func material_add(item,quality):
	dungeonInventory.queue_add(item,quality)
	
func add_to_inventory():
	inventory.bulk_add(dungeonInventory)
	dungeonInventory.slot_datas.clear()

func pay_rent():
	money -= int(rent_value)
	rent_value *= 1.2
	if (money < 0):
		print("TU AS PERDU SALE PAUVRE, RESPECTE LE CAPITAL ESPECE D'ANARCHISTE ECO-TERRORISTE ZADISTE QUI SORT DE L'ARC REPUBLICAIN")


