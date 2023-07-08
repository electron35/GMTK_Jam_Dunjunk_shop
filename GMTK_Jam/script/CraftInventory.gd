extends Control

@onready var grabbed_slot : PanelContainer = $GrabbedSlot
@onready var craft_ui = $HBoxContainer/CraftUI
@onready var inventory_ui = $HBoxContainer/InventoryUI

var Inventory = preload("res://data/Inventory.tres")
var CraftingSlot = preload("res://data/CraftingGrid.tres")
var grabbed_slot_data: SlotData

func _ready():
	inventory_ui.set_inventory_data(Inventory)
	craft_ui.set_inventory_data(CraftingSlot)
	
	Inventory.inventory_interact.connect(on_inventory_interact)
	CraftingSlot.inventory_interact.connect(on_inventory_interact)

func _process(delta):
	if grabbed_slot.visible:
		grabbed_slot.global_position = get_global_mouse_position() + Vector2(5,5)
	
func on_inventory_interact(inventory_data: InventoryData, index: int, button: int):
	#print ("%s %s %s" % [inventory_data, index, button])
	
	match [grabbed_slot_data, button]:
		[null, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.grab_slot_data(index)
		[_, MOUSE_BUTTON_LEFT]:
			grabbed_slot_data = inventory_data.drop_slot_data(grabbed_slot_data, index)
	update_grabbed_slot()


func update_grabbed_slot():
	if grabbed_slot_data:
		grabbed_slot.show()
		grabbed_slot.set_slot_data(grabbed_slot_data)
	else:
		grabbed_slot.hide()
