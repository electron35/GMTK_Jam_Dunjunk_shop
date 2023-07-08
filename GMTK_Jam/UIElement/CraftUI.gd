extends PanelContainer

@onready var crafting_grid = $MarginContainer/VBox/CraftingGrid
var crafting_inventory = preload("res://GMTK_Jam/ScriptableObjects/Instances/MatInventory/CraftingGrid.tres")

const Slot = preload("res://GMTK_Jam/UIElement/SlotUI.tscn")


func set_inventory_data(inventory_data: InventoryData):
	inventory_data.inventory_updated.connect(on_inventory_update)
	on_inventory_update(inventory_data)
	
func on_inventory_update(inventory_data: InventoryData):
	for child in crafting_grid.get_children():
		child.queue_free()
	
	for slot_data in inventory_data.slot_datas:
		var slot = Slot.instantiate()
		crafting_grid.add_child(slot)
		
		slot.slot_clicked.connect(inventory_data.on_slot_clicked)
		
		if slot_data:
			slot.set_slot_data(slot_data)

func _on_button_pressed():
	var slot1
	var slot2
	var crafting_array: Array[String]
	var quality = 0
	var craft_type = ""
	
	var craft_is_valide: bool = false
	
	if crafting_grid.get_child(0):
		slot1 = crafting_grid.get_child(0)
	if crafting_grid.get_child(1):
		slot2 = crafting_grid.get_child(1)
		
	if slot1.type != "" and slot2.type != "":
		crafting_array.append(slot1.type)
		crafting_array.append(slot2.type)
		
		#Ugly way to detect what to craft, will do better latter
		if (crafting_array.has("Stone") and crafting_array.has("Ring")):
			craft_type = "Sword"
		if (crafting_array.has("Stick") and crafting_array.has("Stone")):
			craft_type = "Bow"
		if (crafting_array.has("Stick") and crafting_array.has("Ring")):
			craft_type = "Wand"
		
		if craft_type != "":
			quality = slot1.quality + slot2.quality
			
			print("%s of quality %x" % [craft_type,quality])
			crafting_array.clear()
			for child in crafting_grid.get_children():
				child.queue_free()
			crafting_inventory.empty()
	
	
	
