extends PanelContainer

@onready var craft_slot_1 = $MarginContainer/VBox/CraftSlot1
@onready var craft_slot_2 = $MarginContainer/VBox/CraftSlot2
@onready var crafting_grid = $MarginContainer/VBox/CraftingGrid


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
